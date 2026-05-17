//
//  NowPlayingController.swift
//  Synapse PTCE — Voice Mode
//
//  Surfaces the current voice-mode shift in MPNowPlayingInfoCenter and wires
//  hardware / Control Center transport buttons (play, pause, next, previous,
//  stop) into the VoiceSession. This is the polish that makes voice mode feel
//  like a real podcast / audiobook to the system, not just an app playing
//  audio.
//

import Foundation
import MediaPlayer
#if canImport(UIKit)
import UIKit
#endif

@MainActor
final class NowPlayingController {

    private weak var session: VoiceSession?
    private var artworkProvider: MPMediaItemArtwork?
    private var elapsedAccumulator: TimeInterval = 0
    private var elapsedStart: Date?

    static let shared = NowPlayingController()
    private init() {}

    func attach(_ session: VoiceSession) {
        self.session = session
        wireRemoteCommands()
    }

    func detach() {
        self.session = nil
        clearMetadata()
        unwireRemoteCommands()
    }

    // MARK: - Metadata

    func updateMetadata(shiftTitle: String,
                       sceneLabel: String,
                       awaiting: Bool,
                       elapsedSeconds: TimeInterval) {
        var info: [String: Any] = [:]
        info[MPMediaItemPropertyTitle] = sceneLabel
        info[MPMediaItemPropertyArtist] = shiftTitle
        info[MPMediaItemPropertyAlbumTitle] = "Synapse PTCE"
        info[MPNowPlayingInfoPropertyIsLiveStream] = false
        info[MPNowPlayingInfoPropertyPlaybackRate] = awaiting ? 0.0 : 1.0
        info[MPMediaItemPropertyPlaybackDuration] = 0
        info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = elapsedSeconds
        if let art = artworkProvider {
            info[MPMediaItemPropertyArtwork] = art
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    func clearMetadata() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
        artworkProvider = nil
    }

    // MARK: - Procedural artwork

    /// Called by VoiceSession on attach with the active shift's day number.
    /// Renders a gradient + ridge silhouette + "DAY N" tile and uses it as
    /// the Now Playing artwork so the lock-screen / Control Center / Apple
    /// Watch Now Playing don't fall back to a generic music glyph.
    func setDayNumber(_ day: Int) {
        #if canImport(UIKit)
        artworkProvider = makeArtworkRenderer(for: day)
        #endif
    }

    #if canImport(UIKit)
    private func makeArtworkRenderer(for dayNumber: Int) -> MPMediaItemArtwork {
        let size = CGSize(width: 600, height: 600)
        let palette = RimrockAtmosphere.palette(for: dayNumber)
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { ctx in
            let cg = ctx.cgContext
            let colors = [
                UIColor(palette.skyTop).cgColor,
                UIColor(palette.skyMid).cgColor,
                UIColor(palette.skyBottom).cgColor
            ] as CFArray
            let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                      colors: colors, locations: [0, 0.55, 1])!
            cg.drawLinearGradient(gradient,
                                  start: .zero,
                                  end: CGPoint(x: 0, y: size.height),
                                  options: [])
            let ridgePath = UIBezierPath()
            let baseY = size.height * 0.74
            ridgePath.move(to: CGPoint(x: 0, y: baseY))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.12, y: baseY - 70))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.24, y: baseY - 30))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.38, y: baseY - 110))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.52, y: baseY - 50))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.66, y: baseY - 130))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.80, y: baseY - 60))
            ridgePath.addLine(to: CGPoint(x: size.width * 0.92, y: baseY - 90))
            ridgePath.addLine(to: CGPoint(x: size.width, y: baseY - 40))
            ridgePath.addLine(to: CGPoint(x: size.width, y: size.height))
            ridgePath.addLine(to: CGPoint(x: 0, y: size.height))
            ridgePath.close()
            UIColor.black.withAlphaComponent(0.55).setFill()
            ridgePath.fill()
            let dayString = "DAY \(dayNumber)"
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.monospacedSystemFont(ofSize: 64, weight: .heavy),
                .foregroundColor: UIColor(palette.accent),
            ]
            let textSize = (dayString as NSString).size(withAttributes: attrs)
            (dayString as NSString).draw(
                at: CGPoint(x: 36, y: size.height - textSize.height - 36),
                withAttributes: attrs
            )
            let app = "SYNAPSE PTCE"
            let smallAttrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.monospacedSystemFont(ofSize: 18, weight: .bold),
                .foregroundColor: UIColor.white.withAlphaComponent(0.7),
                .kern: 2.0,
            ]
            (app as NSString).draw(at: CGPoint(x: 36, y: 36), withAttributes: smallAttrs)
        }
        return MPMediaItemArtwork(boundsSize: size) { _ in image }
    }
    #endif

    // MARK: - Remote command targets

    private var didWireCommands = false
    private var commandTokens: [Any] = []

    private func wireRemoteCommands() {
        guard !didWireCommands else { return }
        didWireCommands = true

        let cc = MPRemoteCommandCenter.shared()

        // MPRemoteCommand handlers are documented to be called on the main
        // queue but Swift's compiler can't verify that statically. We hop to
        // the main actor explicitly so Swift 6 strict concurrency is happy
        // and the handler still returns .success synchronously.
        let playToken = cc.playCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in self?.session?.resume() }
            return .success
        }
        let pauseToken = cc.pauseCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in self?.session?.pause() }
            return .success
        }
        let toggleToken = cc.togglePlayPauseCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in
                guard let s = self?.session else { return }
                if case .paused = s.phase { s.resume() } else { s.pause() }
            }
            return .success
        }
        let nextToken = cc.nextTrackCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in self?.session?.skip() }
            return .success
        }
        let prevToken = cc.previousTrackCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in self?.session?.repeatLast() }
            return .success
        }
        let stopToken = cc.stopCommand.addTarget { [weak self] _ in
            Task { @MainActor [weak self] in self?.session?.stop() }
            return .success
        }

        cc.playCommand.isEnabled = true
        cc.pauseCommand.isEnabled = true
        cc.togglePlayPauseCommand.isEnabled = true
        cc.nextTrackCommand.isEnabled = true
        cc.previousTrackCommand.isEnabled = true
        cc.stopCommand.isEnabled = true

        commandTokens = [playToken, pauseToken, toggleToken, nextToken, prevToken, stopToken]
    }

    private func unwireRemoteCommands() {
        let cc = MPRemoteCommandCenter.shared()
        let pairs: [(MPRemoteCommand, Int)] = [
            (cc.playCommand, 0), (cc.pauseCommand, 1), (cc.togglePlayPauseCommand, 2),
            (cc.nextTrackCommand, 3), (cc.previousTrackCommand, 4), (cc.stopCommand, 5)
        ]
        for (cmd, idx) in pairs where idx < commandTokens.count {
            cmd.removeTarget(commandTokens[idx])
        }
        commandTokens.removeAll()
        didWireCommands = false
    }
}

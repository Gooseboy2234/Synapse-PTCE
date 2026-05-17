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
    }

    // MARK: - Remote command targets

    private var didWireCommands = false
    private var commandTokens: [Any] = []

    private func wireRemoteCommands() {
        guard !didWireCommands else { return }
        didWireCommands = true

        let cc = MPRemoteCommandCenter.shared()

        let playToken = cc.playCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            s.resume()
            return .success
        }
        let pauseToken = cc.pauseCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            s.pause()
            return .success
        }
        let toggleToken = cc.togglePlayPauseCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            if case .paused = s.phase { s.resume() } else { s.pause() }
            return .success
        }
        let nextToken = cc.nextTrackCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            s.skip()
            return .success
        }
        let prevToken = cc.previousTrackCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            s.repeatLast()
            return .success
        }
        let stopToken = cc.stopCommand.addTarget { [weak self] _ in
            guard let s = self?.session else { return .commandFailed }
            s.stop()
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

//
//  RimrockAtmosphere.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Shared visual atmosphere — palette and reusable backgrounds tied to the day.
//  The mood shifts across the 25-day arc and the 5 review days:
//
//    Days 1-3   Morning amber       (Act 1: First Shift, learning the ropes)
//    Days 4-10  Bright midday       (Act 2: Settling In)
//    Days 11-18 Dusk → late shift   (Act 3: Something's Wrong)
//    Days 19-25 Night-violet        (Act 4: Resolution, climax)
//    Days 26-30 Dawn return         (Review days, after the arc)
//

import SwiftUI

enum RimrockAtmosphere {

    // MARK: - Palette

    struct Palette {
        let skyTop: Color
        let skyMid: Color
        let skyBottom: Color
        let ridge: Color           // Mountain silhouette
        let ridgeFar: Color        // Far ridge, lighter
        let accent: Color          // Mara / radio amber
        let panel: Color           // Card backgrounds
        let paperBase: Color       // Prescription slip
        let paperWarm: Color       // Header band
        let ink: Color             // Prescription ink
        let sceneText: Color       // Narration
        let label: Color           // Section labels
        let divider: Color
    }

    static func palette(for dayNumber: Int) -> Palette {
        switch dayNumber {

        case 1...3:
            // Morning amber — first shift, learning, soft grays warming up
            return Palette(
                skyTop:    Color(red: 0.075, green: 0.070, blue: 0.065),
                skyMid:    Color(red: 0.105, green: 0.092, blue: 0.078),
                skyBottom: Color(red: 0.135, green: 0.108, blue: 0.085),
                ridge:     Color(red: 0.060, green: 0.058, blue: 0.062),
                ridgeFar:  Color(red: 0.115, green: 0.095, blue: 0.082),
                accent:    Color(red: 0.940, green: 0.730, blue: 0.420),
                panel:     Color(red: 0.115, green: 0.105, blue: 0.092),
                paperBase: Color(red: 0.972, green: 0.962, blue: 0.928),
                paperWarm: Color(red: 0.945, green: 0.918, blue: 0.860),
                ink:       Color(red: 0.115, green: 0.105, blue: 0.092),
                sceneText: Color(red: 0.795, green: 0.745, blue: 0.660),
                label:     Color(red: 0.580, green: 0.540, blue: 0.470),
                divider:   Color(white: 0.18)
            )

        case 4...10:
            // Bright midday — settled, slight teal in shadows
            return Palette(
                skyTop:    Color(red: 0.060, green: 0.068, blue: 0.082),
                skyMid:    Color(red: 0.080, green: 0.085, blue: 0.098),
                skyBottom: Color(red: 0.105, green: 0.108, blue: 0.118),
                ridge:     Color(red: 0.052, green: 0.058, blue: 0.072),
                ridgeFar:  Color(red: 0.085, green: 0.092, blue: 0.110),
                accent:    Color(red: 0.880, green: 0.690, blue: 0.420),
                panel:     Color(red: 0.092, green: 0.098, blue: 0.110),
                paperBase: Color(red: 0.972, green: 0.965, blue: 0.938),
                paperWarm: Color(red: 0.945, green: 0.928, blue: 0.875),
                ink:       Color(red: 0.105, green: 0.108, blue: 0.118),
                sceneText: Color(red: 0.770, green: 0.745, blue: 0.700),
                label:     Color(red: 0.560, green: 0.540, blue: 0.510),
                divider:   Color(white: 0.18)
            )

        case 11...18:
            // Dusk → late shift — orange-to-violet horizon
            return Palette(
                skyTop:    Color(red: 0.062, green: 0.052, blue: 0.085),
                skyMid:    Color(red: 0.095, green: 0.072, blue: 0.105),
                skyBottom: Color(red: 0.125, green: 0.085, blue: 0.115),
                ridge:     Color(red: 0.045, green: 0.040, blue: 0.062),
                ridgeFar:  Color(red: 0.105, green: 0.078, blue: 0.110),
                accent:    Color(red: 0.945, green: 0.640, blue: 0.380),
                panel:     Color(red: 0.105, green: 0.085, blue: 0.115),
                paperBase: Color(red: 0.962, green: 0.945, blue: 0.910),
                paperWarm: Color(red: 0.928, green: 0.895, blue: 0.838),
                ink:       Color(red: 0.118, green: 0.098, blue: 0.115),
                sceneText: Color(red: 0.790, green: 0.745, blue: 0.700),
                label:     Color(red: 0.570, green: 0.530, blue: 0.510),
                divider:   Color(white: 0.20)
            )

        case 19...25:
            // Night-violet — climax, late shifts, the storm clearing
            return Palette(
                skyTop:    Color(red: 0.040, green: 0.032, blue: 0.075),
                skyMid:    Color(red: 0.062, green: 0.048, blue: 0.098),
                skyBottom: Color(red: 0.092, green: 0.068, blue: 0.130),
                ridge:     Color(red: 0.025, green: 0.020, blue: 0.050),
                ridgeFar:  Color(red: 0.075, green: 0.058, blue: 0.105),
                accent:    Color(red: 0.965, green: 0.620, blue: 0.380),
                panel:     Color(red: 0.078, green: 0.062, blue: 0.115),
                paperBase: Color(red: 0.955, green: 0.935, blue: 0.892),
                paperWarm: Color(red: 0.918, green: 0.880, blue: 0.815),
                ink:       Color(red: 0.115, green: 0.092, blue: 0.115),
                sceneText: Color(red: 0.810, green: 0.755, blue: 0.715),
                label:     Color(red: 0.580, green: 0.540, blue: 0.520),
                divider:   Color(white: 0.22)
            )

        default:
            // Days 26-30 — dawn return after the arc, warmer than morning
            return Palette(
                skyTop:    Color(red: 0.085, green: 0.070, blue: 0.060),
                skyMid:    Color(red: 0.115, green: 0.090, blue: 0.072),
                skyBottom: Color(red: 0.145, green: 0.108, blue: 0.082),
                ridge:     Color(red: 0.062, green: 0.052, blue: 0.052),
                ridgeFar:  Color(red: 0.118, green: 0.095, blue: 0.080),
                accent:    Color(red: 0.945, green: 0.730, blue: 0.450),
                panel:     Color(red: 0.118, green: 0.100, blue: 0.085),
                paperBase: Color(red: 0.972, green: 0.962, blue: 0.928),
                paperWarm: Color(red: 0.945, green: 0.918, blue: 0.860),
                ink:       Color(red: 0.115, green: 0.100, blue: 0.085),
                sceneText: Color(red: 0.795, green: 0.745, blue: 0.660),
                label:     Color(red: 0.580, green: 0.540, blue: 0.470),
                divider:   Color(white: 0.19)
            )
        }
    }

    // MARK: - Backgrounds

    /// Full-screen atmospheric background: sky gradient + sun-glow + Bighorns
    /// silhouette at the bottom. The mood shifts based on the day number.
    @ViewBuilder
    static func skyBackground(for dayNumber: Int) -> some View {
        ZStack {
            let p = palette(for: dayNumber)

            // Base gradient
            LinearGradient(
                colors: [p.skyTop, p.skyMid, p.skyBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Sun glow — radial bloom positioned to imply time of day
            sunGlow(for: dayNumber)
                .ignoresSafeArea()

            // Atmospheric haze near the ridges (subtle, day-tinted)
            VStack {
                Spacer()
                LinearGradient(
                    colors: [
                        p.accent.opacity(0.0),
                        p.accent.opacity(0.06),
                        p.accent.opacity(0.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 200)
                .blur(radius: 30)
            }
            .ignoresSafeArea()

            // Far ridge (lighter, behind)
            VStack {
                Spacer()
                BighornRidge(seed: 31, peakHeight: 0.35)
                    .fill(p.ridgeFar)
                    .frame(height: 110)
                    .opacity(0.55)
                    .padding(.bottom, 80)
            }
            .ignoresSafeArea()

            // Near ridge (darker, foreground)
            VStack {
                Spacer()
                BighornRidge(seed: 17, peakHeight: 0.55)
                    .fill(p.ridge)
                    .frame(height: 90)
            }
            .ignoresSafeArea()
        }
    }

    /// Soft radial bloom positioned to suggest the sun at a different point in
    /// the sky depending on the day number — morning low-east, midday overhead,
    /// evening low-west, night below the horizon, dawn return low-east.
    static func sunGlow(for dayNumber: Int) -> some View {
        let p = palette(for: dayNumber)
        let config = sunGlowConfig(for: dayNumber)

        return RadialGradient(
            colors: [p.accent.opacity(config.intensity), p.accent.opacity(0)],
            center: config.position,
            startRadius: 0,
            endRadius: config.radius
        )
        .blur(radius: 18)
        .blendMode(.plusLighter)
    }

    private static func sunGlowConfig(for dayNumber: Int)
        -> (position: UnitPoint, radius: CGFloat, intensity: Double)
    {
        switch dayNumber {
        case 1...3:   return (UnitPoint(x: 0.20, y: 0.92), 320, 0.22)  // morning, low east
        case 4...10:  return (UnitPoint(x: 0.50, y: 0.10), 280, 0.14)  // midday, near top center
        case 11...18: return (UnitPoint(x: 0.85, y: 0.92), 360, 0.28)  // evening, low west
        case 19...25: return (UnitPoint(x: 0.50, y: 1.20), 420, 0.16)  // night, below horizon
        default:      return (UnitPoint(x: 0.18, y: 0.95), 340, 0.24)  // dawn return, low east
        }
    }

    /// Same as skyBackground but no ridges — useful for non-narrative views.
    @ViewBuilder
    static func plainBackground(for dayNumber: Int) -> some View {
        let p = palette(for: dayNumber)
        LinearGradient(
            colors: [p.skyTop, p.skyMid, p.skyBottom],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

// MARK: - Bighorn Ridge

/// A silhouette of an irregular ridgeline. Seed selects which peak pattern;
/// peakHeight (0-1) controls how tall the peaks are relative to the frame.
struct BighornRidge: Shape {

    var seed: Int
    var peakHeight: CGFloat = 0.5

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let baseY = h
        let topY = h * (1.0 - peakHeight)

        path.move(to: CGPoint(x: 0, y: baseY))
        path.addLine(to: CGPoint(x: 0, y: lerp(baseY, topY, 0.6)))

        // Generate stable irregular peaks from the seed
        let peakCount = 14 + (seed % 5)
        var rng = SimpleRNG(seed: UInt64(seed))
        for i in 0...peakCount {
            let x = w * (CGFloat(i) / CGFloat(peakCount))
            let variance = CGFloat(rng.next01()) * 0.55 + 0.25  // 0.25 - 0.80
            let y = lerp(baseY, topY, variance)
            path.addLine(to: CGPoint(x: x, y: y))
        }

        path.addLine(to: CGPoint(x: w, y: lerp(baseY, topY, 0.55)))
        path.addLine(to: CGPoint(x: w, y: baseY))
        path.closeSubpath()
        return path
    }

    private func lerp(_ a: CGFloat, _ b: CGFloat, _ t: CGFloat) -> CGFloat {
        a + (b - a) * t
    }
}

// MARK: - Simple deterministic RNG (for ridge generation)

struct SimpleRNG {
    var state: UInt64
    init(seed: UInt64) { self.state = seed &+ 0x9E3779B97F4A7C15 }
    mutating func next() -> UInt64 {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        return state &>> 32
    }
    mutating func next01() -> Double {
        Double(next() & 0xFFFFFF) / Double(0xFFFFFF)
    }
}

// MARK: - Radio signal indicator

/// Small animated dot representing a live radio transmission.
struct RadioSignalDot: View {
    let color: Color
    @State private var phase: Double = 0

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 6, height: 6)
            .opacity(0.55 + 0.45 * phase)
            .shadow(color: color.opacity(0.8 * phase), radius: 4)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) {
                    phase = 1.0
                }
            }
    }
}

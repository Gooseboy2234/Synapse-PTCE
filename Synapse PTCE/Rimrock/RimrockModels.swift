//
//  RimrockModels.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Data shapes for the Rimrock narrative arc.
//  A Shift is an ordered sequence of Beats. The view plays them in order:
//  narrative beats advance on tap; questions and choices wait for input.
//

import Foundation
import SwiftUI

// MARK: - Speaker

enum RimrockSpeaker: Equatable {
    case mara
    case player
    case narrator
    case named(String)            // "HARLAN", "EVIE", "DOLORES"

    var displayLabel: String {
        switch self {
        case .mara:           return "MARA"
        case .player:         return "YOU"
        case .narrator:       return ""
        case .named(let n):   return n
        }
    }

    /// Mara comes through the radio. Phone callers and walk-ins do not.
    var isRadio: Bool {
        if case .mara = self { return true }
        return false
    }
}

// MARK: - Tone

/// Player-choice tone. Affects rapport with Mara and tunes her response.
enum RimrockTone: String {
    case stoic
    case curious
    case warm
    case press                    // pushing on something Mara is reluctant about
    case accept                   // letting it go
    case neutral
}

// MARK: - Prescription Slip

struct RimrockPrescription {
    let prescriberName: String        // "Dr. Ellen Hollis"
    let prescriberDetail: String?     // "DEA stamp tidy beside the signature."
    let patientName: String
    let patientDOB: String
    let drug: String                  // "Metoprolol Succinate ER"
    let strength: String              // "50 mg"
    let sig: String                   // "i tab po qd"
    let quantity: Int
    let refills: Int
    let isHandwritten: Bool
    let physicalNote: String?         // ambient texture: "fountain pen", "carbon copy", etc.
}

// MARK: - Phone Call

struct RimrockPhoneTurn {
    let speaker: RimrockSpeaker
    let line: String
}

struct RimrockPhoneCall {
    let callerID: String              // "E. ABERNATHY"
    let turns: [RimrockPhoneTurn]
}

// MARK: - Question Domain (Rimrock)

/// Rimrock-specific knowledge domain for in-narrative questions.
/// Simplified domain categorization for Rimrock story content.
enum RimrockDomain: String, Codable {
    case pharmacology
    case law
    case sterile
    case math
    case general
    
    var shortName: String {
        switch self {
        case .pharmacology:  return "PHARM"
        case .law:           return "LAW"
        case .sterile:       return "STERILE"
        case .math:          return "MATH"
        case .general:       return "GEN"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .pharmacology:  return Color(red: 0.40, green: 0.76, blue: 0.64)  // mint
        case .law:           return Color(red: 0.94, green: 0.73, blue: 0.42)  // amber
        case .sterile:       return Color(red: 0.53, green: 0.73, blue: 0.92)  // sky blue
        case .math:          return Color(red: 0.92, green: 0.58, blue: 0.48)  // coral
        case .general:       return Color(red: 0.78, green: 0.72, blue: 0.88)  // lavender
        }
    }

    /// Bridge to the main `KnowledgeDomain` used by the iOS engine + mastery tracker.
    var knowledgeDomain: KnowledgeDomain {
        switch self {
        case .pharmacology:  return .medications
        case .law:           return .federalRequirements
        case .sterile:       return .patientSafety
        case .math:          return .orderEntry
        case .general:       return .patientSafety
        }
    }

    // MARK: - Legacy aliases
    //
    // The Rimrock question bank was authored against the iOS `KnowledgeDomain`
    // case names. These static aliases let those call sites keep compiling
    // against the simplified Rimrock domain set without touching ~1000+
    // question literals.

    static var medications:         RimrockDomain { .pharmacology }
    static var federalRequirements: RimrockDomain { .law }
    static var patientSafety:       RimrockDomain { .sterile }
    static var orderEntry:          RimrockDomain { .general }
}

// MARK: - KnowledgeDomain → RimrockDomain bridge

extension KnowledgeDomain {
    /// Maps the iOS engine's `KnowledgeDomain` to the simplified Rimrock domain
    /// set. Inverse of `RimrockDomain.knowledgeDomain`.
    var rimrockDomain: RimrockDomain {
        switch self {
        case .medications:         return .pharmacology
        case .federalRequirements: return .law
        case .patientSafety:       return .sterile
        case .orderEntry:          return .general
        }
    }
}

// MARK: - Question

/// A PTCE question embedded in the narrative. Decoupled from `DataNode` for now —
/// future passes can migrate these into the existing question bank or vice versa.
struct RimrockQuestion {
    let id: String                    // stable id, e.g. "D1_USP_FRIDGE_TEMP"
    let domain: RimrockDomain         // simplified domain for Rimrock questions
    let topic: String                 // analytics tag: "USP_STORAGE", "BRAND_GENERIC"
    let prompt: String
    let options: [String]
    let correctAnswer: String
    let onCorrect: String             // Mara's line if you got it right
    let onWrong: String               // Mara's line if you didn't (same lesson, different prose)
}

// MARK: - Player Choice

struct RimrockChoice {
    let label: String
    let tone: RimrockTone
    let rapportDelta: Int             // -1, 0, +1
    let response: [RimrockBeat]       // beats that play after the player picks
}

// MARK: - Log Entry

/// An entry the player accrues over the shift — discovered objects, notable patients,
/// resolved cases. Builds out the player's "shift log" / journal across the arc.
struct RimrockLogEntry {
    let title: String
    let body: String
}

// MARK: - Endings (Choose-Your-Own-Adventure)

/// Stakes of a wrong action. Recoverable endings let the shift continue with
/// a rapport hit and a Mara save. Terminal endings end the day — the player
/// must restart the shift and try again.
enum RimrockEndingKind {
    case patientHarmed     // wrong drug, allergy, interaction
    case terminated        // fired by Mara/board for protocol violation
    case licenseRevoked    // tech registration / state board action
    case criminal          // DEA or state criminal investigation
    case recoverable       // Mara catches it before harm — continue with rapport drop

    var headline: String {
        switch self {
        case .patientHarmed:    return "PATIENT HARM"
        case .terminated:       return "TERMINATED"
        case .licenseRevoked:   return "LICENSE ACTION"
        case .criminal:         return "CRIMINAL EXPOSURE"
        case .recoverable:      return "MARA CAUGHT IT"
        }
    }

    /// Terminal endings end the shift. Recoverable lets the player continue.
    var isTerminal: Bool {
        if case .recoverable = self { return false }
        return true
    }
}

/// A scripted outcome of a wrong CYOA choice. Each ending teaches the underlying
/// PTCE rule that the wrong choice violated — the bad path IS the lesson.
struct RimrockEnding {
    let kind: RimrockEndingKind
    let title: String         // short label, e.g. "Anaphylaxis"
    let body: String          // 2–4 sentence narrative consequence
    let ptceLesson: String    // the canonical rule the bad path teaches
}

// MARK: - Beat

/// The atomic unit of a shift. Indirect because some cases hold `[RimrockBeat]`
/// recursively (choice responses).
indirect enum RimrockBeat {
    /// Ambient narrative paragraph. Serif, ambient gray.
    case scene(String)

    /// One or more lines from a single speaker.
    case dialogue(speaker: RimrockSpeaker, lines: [String])

    /// First-time-only — collect the player's name into the engine.
    case nameEntry(prompt: String)

    /// Show a prescription slip. Tap to continue.
    case prescription(RimrockPrescription)

    /// Embedded PTCE question. Locks until answered; then plays the correct/wrong line.
    case question(RimrockQuestion)

    /// Phone-call exchange with caller-ID chrome and line-by-line playback.
    case phoneCall(RimrockPhoneCall)

    /// Player picks one of several responses; each branch carries its own beat list.
    case choice(prompt: String, choices: [RimrockChoice])

    /// Discoverable object (the mug, the note). Optional log entry attaches.
    case object(name: String, description: String, logEntry: RimrockLogEntry?)

    /// Terminal or recoverable consequence of a wrong CYOA choice. Renders as
    /// a full-card ending screen with the PTCE lesson. Terminal endings offer
    /// "Restart Shift"; recoverable endings offer "Live with it" to continue.
    case ending(RimrockEnding)

    /// Marks shift complete and (optionally) gives Mara one last line.
    case shiftEnd(closingLine: String?)
}

// MARK: - Shift

struct RimrockShift: Identifiable {
    let dayNumber: Int                // 1...25
    let title: String                 // "Rimrock"
    let dateLine: String              // "Tuesday, May 12"
    let timeLine: String              // "8:41 AM"
    let locationLine: String          // "Johnson County, Wyoming"
    let beats: [RimrockBeat]

    var id: Int { dayNumber }
}

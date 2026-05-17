//
//  StorySystem.swift
//  Synapse PTCE — The Shelf Break Dispensary
//
//  Narrative infrastructure for the underwater pharmacy story.
//  Ellis Kovač, PhT (Provisional), works alone 600 meters down.
//  The crew has vanished. The logs are corrupted. Protocol Phenomenon unfolds.
//

import Foundation
import SwiftUI

// MARK: - Chapter Definition

/// A Chapter maps to a PTCE domain and contains narrative context.
struct Chapter: Identifiable, Codable {
    let id: Int
    let title: String                    // e.g., "Night Shift"
    let domain: KnowledgeDomain          // Maps to existing domain system
    let subtitle: String                 // Brief descriptor
    let introNarrative: String           // Story shown before questions
    let unlockThreshold: Double          // 0.0 = available immediately
    
    var isUnlocked: Bool {
        unlockThreshold == 0.0
    }
    
    /// Chapter completion is based on domain progress in GameEngine
    func progress(from engine: GameEngine) -> Double {
        let domainProg = engine.progress(for: domain)
        return domainProg.percentComplete
    }
}

// MARK: - Narrative Context

/// Wraps a PTCE question in story context (used in EncounterView)
struct NarrativeContext: Codable {
    let setupText: String                // Story before question
    let locationTag: String              // e.g., "DISPENSARY", "VAULT", "MEDICAL_BAY"
    let urgencyLevel: UrgencyLevel       // Affects UI presentation
    let relatedCharacter: String?        // NPC involved (e.g., "Dr. Reyes")
    
    enum UrgencyLevel: String, Codable {
        case routine     // Normal dispensary work
        case elevated    // Something's off
        case critical    // Life-or-death / major discovery
    }
}

// MARK: - Story Log

/// Discoverable narrative elements (audio logs, documents, terminal messages)
struct StoryLog: Identifiable, Codable {
    let id: String
    let type: LogType
    let title: String
    let author: String               // Which NPC
    let stationDay: Int              // In-world timestamp (Day -14, Day 0, etc.)
    let content: String
    let unlockChapter: Int           // Which chapter reveals this
    let unlockProgress: Double       // Domain % needed to unlock
    let domain: KnowledgeDomain?     // Associated domain (nil = any)
    
    enum LogType: String, Codable {
        case audio
        case email
        case terminalLog
        case prescription
        case incidentReport
        case researchNote
    }
    
    var timestamp: String {
        if stationDay < 0 {
            return "DAY \(stationDay)" // e.g., "DAY -14"
        } else if stationDay == 0 {
            return "DAY 0 — SHIFT START"
        } else {
            return "DAY +\(stationDay)"
        }
    }
}

// MARK: - Character Dossier

/// NPCs who appear via logs and messages
struct CharacterDossier: Identifiable, Codable {
    let id: String
    let name: String
    let role: String                 // e.g., "Chief Pharmacist", "Station Director"
    let status: String               // e.g., "MISSING", "EVACUATED", "LOCATION UNKNOWN"
    let bio: String                  // Background
    let voiceNote: String            // Personality/speaking style for logs
}

// MARK: - Protocol Phenomenon Timeline

/// The core mystery — what really happened at Shelf Break
struct ProtocolEvent: Identifiable, Codable {
    let id: String
    let stationDay: Int
    let eventTitle: String
    let description: String
    let revealChapter: Int           // When player learns about this
}

// MARK: - Story Progress (extends UserStats)

extension UserStats {
    
    /// Chapters are unlocked based on overall stability score milestones
    func unlockedChapters() -> Set<Int> {
        var unlocked: Set<Int> = [1] // Chapter 1 always available
        
        // Unlock chapters based on stability score
        if stabilityScore >= 100  { unlocked.insert(2) } // 10% complete
        if stabilityScore >= 250  { unlocked.insert(3) } // 25%
        if stabilityScore >= 400  { unlocked.insert(4) } // 40%
        if stabilityScore >= 550  { unlocked.insert(5) } // 55%
        if stabilityScore >= 700  { unlocked.insert(6) } // 70%
        if stabilityScore >= 825  { unlocked.insert(7) } // 82.5%
        if stabilityScore >= 900  { unlocked.insert(8) } // 90%
        if stabilityScore >= 975  { unlocked.insert(9) } // 97.5%
        
        return unlocked
    }
    
    /// Current narrative chapter based on progress
    var currentChapter: Int {
        if stabilityScore >= 975 { return 9 }
        if stabilityScore >= 900 { return 8 }
        if stabilityScore >= 825 { return 7 }
        if stabilityScore >= 700 { return 6 }
        if stabilityScore >= 550 { return 5 }
        if stabilityScore >= 400 { return 4 }
        if stabilityScore >= 250 { return 3 }
        if stabilityScore >= 100 { return 2 }
        return 1
    }
    
    /// Logs discovered (stored as comma-separated string in future)
    func isLogDiscovered(_ logID: String) -> Bool {
        // TODO: Add `discoveredLogsRaw: String` to UserStats model
        // For now, auto-unlock based on chapter progress
        return true
    }
}

// MARK: - Story Content Database

/// Loads all narrative content from embedded JSON or hardcoded data
@Observable
class StoryDatabase {
    
    let chapters: [Chapter]
    let logs: [StoryLog]
    let characters: [CharacterDossier]
    let timeline: [ProtocolEvent]
    
    init() {
        // For now, hardcoded. In production, load from JSON in Bundle.
        self.chapters = StoryDatabase.loadChapters()
        self.logs = StoryDatabase.loadLogs()
        self.characters = StoryDatabase.loadCharacters()
        self.timeline = StoryDatabase.loadTimeline()
    }
    
    func chapter(for domain: KnowledgeDomain) -> Chapter? {
        chapters.first { $0.domain == domain }
    }
    
    func logs(forChapter chapterID: Int) -> [StoryLog] {
        logs.filter { $0.unlockChapter == chapterID }
    }
    
    // MARK: - Content Loaders
    
    private static func loadChapters() -> [Chapter] {
        [
            Chapter(
                id: 1,
                title: "Night Shift",
                domain: .medications,
                subtitle: "Something is wrong with the logs",
                introNarrative: """
                The double shift wasn't supposed to be a problem.
                
                Dr. Reyes left three days ago—personal leave, they said. Marcus Chen assured you it was routine. Just keep the dispensary running until the relief crew arrives.
                
                But now, sixteen hours into your shift, 600 meters below the surface, you notice something in the medication logs. A discrepancy. Small. Almost invisible.
                
                But you're a pharmacy tech. You notice everything.
                
                Your hand reaches for the terminal keyboard. The cursor blinks in the blue emergency lighting.
                
                Outside your porthole, something bioluminescent drifts past in the absolute dark.
                
                Time to get to work.
                """,
                unlockThreshold: 0.0
            ),
            
            Chapter(
                id: 2,
                title: "The Missing Inventory",
                domain: .federalRequirements,
                subtitle: "DEA protocols violated",
                introNarrative: """
                Your weekly Schedule II audit reveals the impossible.
                
                The system shows 120 tablets of oxycodone remaining. Your physical count: 237 tablets.
                
                Someone has been ADDING controlled substances to the vault. Without documentation. Without authorization.
                
                You pull up the access logs. Entries during hours when the station was unmanned—or worse, entries under YOUR credentials while you were asleep in your quarters.
                
                This isn't human error. This is deliberate.
                
                The hull groans under pressure. Somewhere in the station, a door cycles open.
                
                You're not alone down here.
                """,
                unlockThreshold: 0.10
            ),
            
            Chapter(
                id: 3,
                title: "Distress Signals",
                domain: .patientSafety,
                subtitle: "The crew is still here—and sick",
                introNarrative: """
                The pneumatic tube system hisses to life.
                
                A prescription canister arrives from Medical Bay. Dr. Okonkwo's electronic signature. But Dr. Okonkwo evacuated two weeks ago. You saw him board the submarine yourself.
                
                You open the canister. The prescription requests are... wrong. Drugs that shouldn't interact. Dosages that make no sense. Medications for conditions that haven't existed since the 1950s.
                
                Unless something down here is changing. Adapting. Mutating.
                
                You pull up the crew manifest. Seven names listed as "evacuated."
                
                But the life support system shows eleven active biometric signatures.
                
                Four extra people. Or four extra THINGS.
                """,
                unlockThreshold: 0.25
            ),
            
            Chapter(
                id: 4,
                title: "Contamination Protocol",
                domain: .orderEntry,
                subtitle: "Unauthorized compounds detected",
                introNarrative: """
                The clean room shows signs of recent use.
                
                IV bags line the compounding hood. Labels printed with NDC numbers that don't exist in any database. Chemical formulas you don't recognize.
                
                You run a sample through the spectrophotometer.
                
                Results: UNKNOWN COMPOUND. POSSIBLE BIOLOGICAL ORIGIN.
                
                Dr. Reyes's final research note, hidden in the locked drawer:
                
                "They've been using us as test subjects. DeepMed Logistics never planned to bring us home. The 'supply shortages' were engineered. We're not a pharmacy. We're a lab."
                
                The lights flicker. The pressure alarm chirps.
                
                And then you hear it: footsteps. In the corridor outside the dispensary.
                
                Slow. Deliberate. Coming closer.
                """,
                unlockThreshold: 0.40
            ),
            
            Chapter(
                id: 5,
                title: "The Reyes Files",
                domain: .medications,
                subtitle: "Decrypting the truth",
                introNarrative: """
                You've cracked Dr. Reyes's encrypted drive.
                
                Inside: months of covert research. Pharmacological data. Human trials. Neurochemical profiles.
                
                The Protocol Phenomenon isn't a glitch. It's a cognitive parasite transmitted through pharmaceutical compounds. It rewrites host neurochemistry—makes them compliant, obedient, easy to control.
                
                DeepMed didn't evacuate the crew. They CONVERTED them.
                
                And now the converted crew members need you to keep dispensing medications. To keep the station running. To keep the experiment going.
                
                Because you're the last uninfected human on Shelf Break.
                
                The only question: how long until they decide you're more useful as a test subject than a technician?
                """,
                unlockThreshold: 0.55
            ),
            
            Chapter(
                id: 6,
                title: "Ghost Prescriptions",
                domain: .federalRequirements,
                subtitle: "Decoding the pattern",
                introNarrative: """
                The prescription system has been sending you messages.
                
                Hidden in sig codes. Embedded in NDC numbers. Encrypted in prior authorization notes.
                
                It's Dr. Reyes. Still alive. Still fighting. Somewhere in the station's sealed medical wing.
                
                The prescriptions you've been filling? They're not treatment protocols. They're PUZZLES.
                
                Each correct answer unlocks another piece of the station's security system. Each domain you master gives you access to another sealed module.
                
                Reyes is guiding you toward something. A way out. Or a way to stop Protocol.
                
                But the others know. And they're closing in.
                """,
                unlockThreshold: 0.70
            ),
            
            Chapter(
                id: 7,
                title: "Pressure",
                domain: .patientSafety,
                subtitle: "Life-or-death calculations",
                introNarrative: """
                The hull breach alarm screams to life.
                
                Section C-7 is flooding. Pressure doors failing. Six minutes until catastrophic structural failure.
                
                Dr. Reyes's voice crackles over the emergency channel:
                
                "Ellis, listen carefully. The antidote compound is in the vault. Formula NRX-9440. You need to prepare IV admixtures for all infected crew—but the calculations have to be PERFECT. One mistake and the osmotic pressure differential will kill them."
                
                The station shudders. Metal screams.
                
                You have the formula. You have the raw compounds.
                
                But you only have six minutes.
                
                Time to prove you're not provisional anymore.
                """,
                unlockThreshold: 0.825
            ),
            
            Chapter(
                id: 8,
                title: "The Deep Vault",
                domain: .orderEntry,
                subtitle: "What they were really testing",
                introNarrative: """
                The final security door hisses open.
                
                The Deep Vault. The place Dr. Reyes warned you about in her earliest logs.
                
                Inside: rows of cryogenic specimen chambers. Hundreds of vials. All labeled with the same compound code: PROTO-SYNAPSE.
                
                The pharmaceutical agent that started everything. The one DeepMed designed to "enhance cognitive compliance in remote workforce populations."
                
                The one that went wrong.
                
                You access the manifest. Shelf Break was Phase 1. But there are coordinates for Phase 2 installations.
                
                Fifteen other underwater stations. Thirty oil rigs. Eight Arctic research bases.
                
                Thousands of people. All test subjects.
                
                And you're the only one who knows.
                """,
                unlockThreshold: 0.90
            ),
            
            Chapter(
                id: 9,
                title: "Surface",
                domain: .medications,
                subtitle: "The final protocol",
                introNarrative: """
                The escape pod bay. Your only way out.
                
                Dr. Reyes is with you now—weak, but conscious. The antidote worked. The crew is sedated in Medical Bay, stable for now.
                
                You have the evidence. The compound samples. The encrypted manifests.
                
                But DeepMed knows. The surface vessel approaching isn't a rescue ship. It's a containment team.
                
                If you surface, they'll take the evidence. Destroy it. Bury the truth.
                
                Dr. Reyes hands you a data drive.
                
                "Everything you've learned down here—every question, every protocol, every calculation—that's your weapon now. You're not provisional anymore, Ellis. You're the only certified witness to corporate mass poisoning."
                
                The escape pod systems power up.
                
                One last question remains:
                
                Do you surface and face them?
                
                Or do you go deeper—and expose everything?
                """,
                unlockThreshold: 0.975
            )
        ]
    }
    
    private static func loadLogs() -> [StoryLog] {
        [
            StoryLog(
                id: "reyes_001",
                type: .audio,
                title: "Dr. Reyes — Personal Log 001",
                author: "Dr. Amara Reyes, PharmD",
                stationDay: -14,
                content: """
                [AUDIO LOG — DR. REYES]
                
                Day -14. 22:47 station time.
                
                Something's wrong with the latest DeepMed shipment. The NDC numbers don't match the packing slips. When I confronted Marcus about it, he told me to "trust the system."
                
                I don't trust the system. That's why I became a pharmacist.
                
                I'm starting a private audit. If I find what I think I'm going to find...
                
                Ellis, if you're hearing this, it means I didn't make it home. But you can. You have to.
                
                [RECORDING ENDS]
                """,
                unlockChapter: 1,
                unlockProgress: 0.0,
                domain: .medications
            ),
            
            StoryLog(
                id: "chen_surface_001",
                type: .email,
                title: "Marcus Chen to Surface Control",
                author: "Marcus Chen, Station Director",
                stationDay: -7,
                content: """
                FROM: chen.m@shelfbreak.deepmed.com
                TO: surface.control@deepmed.logistics
                SUBJECT: Phase 1 Compliance Rates
                
                Control,
                
                Compliance at 87% across crew. Dr. Reyes remains resistant. Recommend early evacuation under medical pretext.
                
                Kovač (provisional tech) shows no exposure signs. Cognitive baseline stable. Recommend retention as control subject.
                
                Awaiting Phase 2 authorization.
                
                — M. Chen
                Station Director, Shelf Break
                """,
                unlockChapter: 2,
                unlockProgress: 0.15,
                domain: .federalRequirements
            )
            
            // TODO: Add 20+ more logs across all chapters
        ]
    }
    
    private static func loadCharacters() -> [CharacterDossier] {
        [
            CharacterDossier(
                id: "reyes",
                name: "Dr. Amara Reyes",
                role: "Chief Pharmacist, PharmD",
                status: "MISSING — LAST SEEN DAY -7",
                bio: "15 years experience in remote pharmaceutical operations. Former Navy. Doesn't trust corporate management. Started noticing irregularities three months before disappearance.",
                voiceNote: "Direct, clinical, protective. Treats Ellis like a mentee."
            ),
            
            CharacterDossier(
                id: "chen",
                name: "Marcus Chen",
                role: "Station Director",
                status: "LOCATION UNKNOWN",
                bio: "DeepMed corporate liaison. Always calm. Too calm. Last communication showed 'behavioral anomalies' per crew reports.",
                voiceNote: "Corporate speak. Evasive. Increasingly detached."
            ),
            
            CharacterDossier(
                id: "okonkwo",
                name: "Dr. Ibrahim Okonkwo",
                role: "Medical Officer, MD",
                status: "EVACUATED (OFFICIAL) / UNKNOWN (ACTUAL)",
                bio: "Trauma surgeon, former MSF. You watched him board the evacuation sub two weeks ago. But prescriptions with his signature keep arriving.",
                voiceNote: "Urgent, empathetic, increasingly desperate in later logs."
            )
            
            // TODO: Add remaining crew (7-10 characters total)
        ]
    }
    
    private static func loadTimeline() -> [ProtocolEvent] {
        [
            ProtocolEvent(
                id: "proto_origin",
                stationDay: -180,
                eventTitle: "Shelf Break Goes Operational",
                description: "DeepMed Logistics establishes Shelf Break as pharmaceutical supply depot for offshore settlements. Hidden objective: human trials for cognitive compliance agent PROTO-SYNAPSE.",
                revealChapter: 8
            ),
            
            ProtocolEvent(
                id: "first_exposure",
                stationDay: -90,
                eventTitle: "First Crew Exposure",
                description: "PROTO-SYNAPSE introduced into crew via 'vitamin supplements.' Initial compliance rates exceed projections.",
                revealChapter: 5
            ),
            
            ProtocolEvent(
                id: "reyes_investigation",
                stationDay: -60,
                eventTitle: "Dr. Reyes Begins Investigation",
                description: "Reyes notices inventory irregularities and begins covert research. Discovers neurochemical markers in crew blood work.",
                revealChapter: 3
            ),
            
            ProtocolEvent(
                id: "reyes_disappears",
                stationDay: -7,
                eventTitle: "Dr. Reyes Vanishes",
                description: "Last official log entry. Reyes confronts Chen about findings. Is locked in Medical Bay Module C under 'quarantine protocol.'",
                revealChapter: 6
            ),
            
            ProtocolEvent(
                id: "kovac_double_shift",
                stationDay: 0,
                eventTitle: "Ellis Kovač's Double Shift Begins",
                description: "Ellis volunteers for extended shift. Airlocks sealed under 'maintenance protocol.' You are now trapped with the converted crew.",
                revealChapter: 1
            )
            
            // TODO: Add complete 20-event timeline
        ]
    }
}

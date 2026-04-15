//
//  StoryManager.swift
//  Synapse PTCE
//
//  Narrative terminal sequences triggered every 5% of stability gained.
//  Story: the user is a "System Architect" uncovering why the medical database was wiped.
//

import Foundation

// MARK: - Story Beat

struct StoryBeat: Identifiable {
    let id = UUID()
    /// Stability % milestone that triggers this beat (5, 10, 15 … 100).
    let triggerPercent: Int
    let title: String
    let lines: [String]
}

// MARK: - Story Manager

enum StoryManager {

    // 20 beats — one per 5% milestone from 5% → 100%
    static let beats: [StoryBeat] = [

        StoryBeat(triggerPercent: 5,  title: "SYSTEM BOOT",
                  lines: ["[SYN] RECOVERY PROTOCOL INITIATED...",
                          "[SYN] You are SYSTEM ARCHITECT.",
                          "[SYN] The PTCE Medical Network has been wiped.",
                          "[SYN] Unknown agent. Unknown motive.",
                          "[SYN] Your mission: restore the database node by node.",
                          "[SYN] FRAGMENT_001 recovered. Continue."]),

        StoryBeat(triggerPercent: 10, title: "FIRST TRACE",
                  lines: ["[SYN] ANOMALY in recovery logs detected.",
                          "[SYN] The deletion signature is methodical — not random.",
                          "[SYN] Someone knew exactly which nodes to remove.",
                          "[SYN] This was not an accident.",
                          "[SYN] FRAGMENT_002 recovered."]),

        StoryBeat(triggerPercent: 15, title: "SIGNAL GHOST",
                  lines: ["[SYN] Encrypted handshake found in sector headers.",
                          "[SYN] Origin: INTERNAL. An authorized account.",
                          "[SYN] They had root access. High clearance.",
                          "[SYN] The wipe was an inside job.",
                          "[SYN] FRAGMENT_003 recovered. Stay alert."]),

        StoryBeat(triggerPercent: 20, title: "OLD RECORDS",
                  lines: ["[SYN] Partial metadata uncovered: 'PROJECT REDLINE'",
                          "[SYN] A failed PTCB curriculum reform — buried three years ago.",
                          "[SYN] Someone did not want it remembered.",
                          "[SYN] Or wanted it erased for good.",
                          "[SYN] FRAGMENT_004 recovered."]),

        StoryBeat(triggerPercent: 25, title: "CORRUPTED LOG",
                  lines: ["[SYN] A corrupted audit log partially recovered.",
                          "[SYN] Timestamp: 03:14 AM. Single session. Six hours.",
                          "[SYN] They worked through the night.",
                          "[SYN] Whoever this is — they are thorough.",
                          "[SYN] FRAGMENT_005 recovered."]),

        StoryBeat(triggerPercent: 30, title: "PHANTOM USER",
                  lines: ["[SYN] Ghost account identified: USER_7734",
                          "[SYN] Account created on the same day as the wipe.",
                          "[SYN] No employee record. No biometrics on file.",
                          "[SYN] A shadow. A construct.",
                          "[SYN] FRAGMENT_006 recovered. You are getting closer."]),

        StoryBeat(triggerPercent: 35, title: "BURIED NODE",
                  lines: ["[SYN] Hidden sector discovered beneath Domain 2.",
                          "[SYN] Classified data: internal exam pass-rate distributions.",
                          "[SYN] Pass rates declining every year for five years.",
                          "[SYN] Someone believed the data itself was the problem.",
                          "[SYN] FRAGMENT_007 recovered."]),

        StoryBeat(triggerPercent: 40, title: "FIRST NAME",
                  lines: ["[SYN] Cross-referencing access logs with HR records...",
                          "[SYN] One name appears in both: DR_CALLOWAY.",
                          "[SYN] Former curriculum director. Resigned abruptly.",
                          "[SYN] Motive: unclear. Presence: confirmed.",
                          "[SYN] FRAGMENT_008 recovered."]),

        StoryBeat(triggerPercent: 45, title: "SHADOW PROTOCOL",
                  lines: ["[SYN] DR_CALLOWAY's terminal traffic analyzed.",
                          "[SYN] She was building a counter-database. A rival system.",
                          "[SYN] Built to replace this network with adaptive difficulty.",
                          "[SYN] She wiped the old system to make room.",
                          "[SYN] FRAGMENT_009 recovered. Motive: established."]),

        StoryBeat(triggerPercent: 50, title: "MIDPOINT MEMO",
                  lines: ["[SYN] ■ SYSTEM STATUS: 50% RESTORED ■",
                          "[SYN] You have passed the point of no return.",
                          "[SYN] DR_CALLOWAY's rival system — never deployed.",
                          "[SYN] Funding was pulled. Politics. The usual.",
                          "[SYN] She wiped the network for nothing.",
                          "[SYN] FRAGMENT_010 recovered."]),

        StoryBeat(triggerPercent: 55, title: "LOCKED VAULT",
                  lines: ["[SYN] Her counter-database: partially recovered.",
                          "[SYN] Encrypted with a 6-digit key.",
                          "[SYN] The key is embedded in the drug interaction matrix.",
                          "[SYN] You are already building it. Keep going.",
                          "[SYN] FRAGMENT_011 recovered."]),

        StoryBeat(triggerPercent: 60, title: "INSIDE MAN",
                  lines: ["[SYN] Second collaborator identified: USER_ADMIN_K.",
                          "[SYN] Still active. Still employed.",
                          "[SYN] They have been watching your recovery progress.",
                          "[SYN] Someone does not want this database rebuilt.",
                          "[SYN] FRAGMENT_012 recovered. Watch your back."]),

        StoryBeat(triggerPercent: 65, title: "THE MOTIVE",
                  lines: ["[SYN] Full picture emerging.",
                          "[SYN] DR_CALLOWAY believed PTCB content was critically outdated.",
                          "[SYN] She wanted to force a complete curriculum rebuild.",
                          "[SYN] Burn it down. Start fresh.",
                          "[SYN] A radical answer to a real problem.",
                          "[SYN] FRAGMENT_013 recovered."]),

        StoryBeat(triggerPercent: 70, title: "COUNTER-SIGNAL",
                  lines: ["[SYN] USER_ADMIN_K has attempted to slow the recovery.",
                          "[SYN] Two sectors briefly re-corrupted. You did not notice.",
                          "[SYN] Your Logic Probe caught it. Corrected silently.",
                          "[SYN] The Probe is more than a tool. It learns.",
                          "[SYN] FRAGMENT_014 recovered."]),

        StoryBeat(triggerPercent: 75, title: "FINAL KEY",
                  lines: ["[SYN] The 6-digit vault key: assembled from recovered nodes.",
                          "[SYN] DR_CALLOWAY's backup system: decrypted.",
                          "[SYN] She was right. The content WAS outdated.",
                          "[SYN] But her method was wrong.",
                          "[SYN] You are proving that right now.",
                          "[SYN] FRAGMENT_015 recovered."]),

        StoryBeat(triggerPercent: 80, title: "THE RECKONING",
                  lines: ["[SYN] DR_CALLOWAY's identity: fully confirmed.",
                          "[SYN] She has been monitoring this recovery remotely.",
                          "[SYN] A message arrives:",
                          "[SYN] 'You are fixing what I should have fixed.'",
                          "[SYN] No threat. No demand. Just acknowledgement.",
                          "[SYN] FRAGMENT_016 recovered."]),

        StoryBeat(triggerPercent: 85, title: "LAST STAND",
                  lines: ["[SYN] USER_ADMIN_K makes a final attempt to halt recovery.",
                          "[SYN] Full sector corruption attack on Domain 4.",
                          "[SYN] Your Logic Probe absorbs it completely.",
                          "[SYN] The attack fails. USER_ADMIN_K goes offline.",
                          "[SYN] FRAGMENT_017 recovered. Almost there."]),

        StoryBeat(triggerPercent: 90, title: "ECHO",
                  lines: ["[SYN] A final encrypted message from DR_CALLOWAY:",
                          "[SYN] 'The network was broken before I touched it.'",
                          "[SYN] 'The students were failing because no one cared enough.'",
                          "[SYN] 'You care. That is why you are still here.'",
                          "[SYN] FRAGMENT_018 recovered."]),

        StoryBeat(triggerPercent: 95, title: "SYSTEM INTACT",
                  lines: ["[SYN] 95% recovery. One final sector remains.",
                          "[SYN] The database is more complete than before the wipe.",
                          "[SYN] Every node you have restored — better than the original.",
                          "[SYN] DR_CALLOWAY's rival system: archived, not destroyed.",
                          "[SYN] Maybe someday it will be useful.",
                          "[SYN] FRAGMENT_019 recovered. Finish it."]),

        StoryBeat(triggerPercent: 100, title: "NETWORK RESTORED",
                  lines: ["[SYN] ■ FULL SYSTEM RECOVERY COMPLETE ■",
                          "[SYN] Stability: 1000 / 1000.",
                          "[SYN] The PTCE Medical Network is online.",
                          "[SYN] All nodes: verified, tested, secured.",
                          "[SYN] DR_CALLOWAY: sealed. USER_ADMIN_K: terminated.",
                          "[SYN] Your Logic Probe has reached MASTER level.",
                          "[SYN] You are now the System Architect.",
                          "[SYN] ■ MISSION ACCOMPLISHED ■"])
    ]

    /// Returns the next story beat to show, if the current stability score has
    /// crossed into a new 5% band that hasn't been presented yet.
    ///
    /// - Parameters:
    ///   - stabilityScore: Current score out of 1000.
    ///   - shownCount: Number of beats already shown this run.
    static func nextBeat(stabilityScore: Int, shownCount: Int) -> StoryBeat? {
        let pct   = (stabilityScore * 100) / 1000          // 0–100
        let index = min((pct / 5) - 1, beats.count - 1)   // -1 because beats start at 5%
        guard index >= 0, index >= shownCount else { return nil }
        return beats[safe: shownCount]
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

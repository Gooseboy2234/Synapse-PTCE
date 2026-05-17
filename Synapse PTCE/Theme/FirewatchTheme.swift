//
//  FirewatchTheme.swift
//  Synapse PTCE
//
//  ╔═══════════════════════════════════════════════════════════════════════════╗
//  ║                         DUAL THEME SYSTEM                                 ║
//  ╠═══════════════════════════════════════════════════════════════════════════╣
//  ║  Two complete narrative experiences coexist in this application:          ║
//  ║                                                                           ║
//  ║  FIREWATCH MODE: Warm wilderness adventure (ranger/lookout theme)         ║
//  ║  • Story: User is a fire lookout ranger in Shoshone National Forest       ║
//  ║  • Aesthetic: Sunset oranges, forest greens, nature-inspired              ║
//  ║  • Terminology: Lookouts, Trail Miles, Fire Tokens, Ranger Badges         ║
//  ║  • Story beats: Event-driven (firstLookout, perfectClear, etc.)           ║
//  ║                                                                           ║
//  ║  SYNAPSE MODE: Cyberpunk neural network (architect/system theme)          ║
//  ║  • Story: User is System Architect rebuilding medical database            ║
//  ║  • Aesthetic: Neon oranges, electric blues, tech/grid visuals             ║
//  ║  • Terminology: Nodes, XP, Data Shards, Achievements                      ║
//  ║  • Story beats: Progress-driven (5%, 10%, 15% stability milestones)       ║
//  ╚═══════════════════════════════════════════════════════════════════════════╝
//
//  ┌─────────────────────────────────────────────────────────────────────────┐
//  │ IMPORTANT FOR CONTRIBUTORS - FILE STRUCTURE:                            │
//  ├─────────────────────────────────────────────────────────────────────────┤
//  │                                                                         │
//  │ THIS FILE (FirewatchTheme.swift):                                       │
//  │   • AppThemeMode enum - Global theme switcher                           │
//  │   • Firewatch namespace - All Firewatch-specific types                  │
//  │     - Firewatch.StoryBeat (event-driven dialogue)                       │
//  │     - Firewatch.StoryChapter (chapter-based progression)                │
//  │     - Firewatch.StoryTrigger (gameplay events)                          │
//  │     - Firewatch.StoryContext (player stats)                             │
//  │   • FirewatchColors struct - Nature-inspired palette                    │
//  │   • FirewatchStoryManager class - Chapter progression logic             │
//  │   • FirewatchStoryBeatView - Dialogue presentation UI                   │
//  │   • FirewatchStoryLibraryView - Story chapter browser                   │
//  │   • ThemeManager class - Contextual theming (uses AppThemeMode)         │
//  │                                                                         │
//  │ StoryManager.swift (Original Synapse system):                           │
//  │   • StoryBeat (progress % driven, no namespace)                         │
//  │   • StoryManager enum - 20 beats at 5% intervals                        │
//  │                                                                         │
//  │ PersistenceModels.swift:                                                │
//  │   • Theme enum (amber/cobalt/emerald/crimson color schemes)             │
//  │   • SystemRank enum (XP progression ranks)                              │
//  │   • MasteryLevel enum (per-domain progress)                             │
//  │                                                                         │
//  └─────────────────────────────────────────────────────────────────────────┘
//
//  ┌─────────────────────────────────────────────────────────────────────────┐
//  │ HOW TO USE BOTH SYSTEMS:                                                │
//  ├─────────────────────────────────────────────────────────────────────────┤
//  │                                                                         │
//  │ 1. Theme Selection:                                                     │
//  │    let themeManager = ThemeManager()                                    │
//  │    if themeManager.currentTheme == .firewatch {                         │
//  │        // Use Firewatch story system                                    │
//  │    } else {                                                             │
//  │        // Use Synapse story system                                      │
//  │    }                                                                    │
//  │                                                                         │
//  │ 2. Firewatch Story Integration:                                         │
//  │    let firewatchStory = FirewatchStoryManager()                         │
//  │    let context = Firewatch.StoryContext(                                │
//  │        lookutsCompleted: userStats.questsCompleted,                     │
//  │        totalXP: userStats.xp,                                           │
//  │        studyStreak: userStats.streak,                                   │
//  │        bossesDefeated: userStats.bossesDefeated,                        │
//  │        domainsMastered: userStats.masteredDomains,                      │
//  │        perfectClears: userStats.perfectRuns                             │
//  │    )                                                                    │
//  │    firewatchStory.trigger(.firstLookout, context: context)              │
//  │                                                                         │
//  │ 3. Synapse Story Integration:                                           │
//  │    if let beat = StoryManager.nextBeat(                                 │
//  │        stabilityScore: stability,                                       │
//  │        shownCount: shownBeats                                           │
//  │    ) {                                                                  │
//  │        // Show Synapse story beat                                       │
//  │    }                                                                    │
//  │                                                                         │
//  │ 4. UI Terminology (use ThemeManager):                                   │
//  │    Text(themeManager.nodeLabel)      // "Lookout" or "Node"             │
//  │    Text(themeManager.xpLabel)        // "Trail Miles" or "XP"           │
//  │    Text(themeManager.shardsLabel)    // "Fire Tokens" or "Data Shards"  │
//  │                                                                         │
//  └─────────────────────────────────────────────────────────────────────────┘
//
//  ⚠️  NAMESPACE CONFLICTS TO AVOID:
//      • Never use unqualified "StoryBeat" - use Firewatch.StoryBeat explicitly
//      • StoryManager refers to Synapse enum, FirewatchStoryManager is the class
//      • Theme enum is for colors (amber/cobalt), AppThemeMode is the switcher
//
//  Created: May 2026
//  Last Updated: May 5, 2026
//

import Foundation
import SwiftUI

// MARK: - Theme Mode Selector (Shared)

/// Global theme selector that switches between Firewatch and Synapse experiences
enum AppThemeMode: String, Codable, CaseIterable {
    case firewatch = "FIREWATCH"
    case synapse = "SYNAPSE"
    
    var displayName: String {
        switch self {
        case .firewatch: return "Firewatch"
        case .synapse: return "Synapse Neural"
        }
    }
    
    var description: String {
        switch self {
        case .firewatch: return "Warm wilderness adventure with narrative storytelling"
        case .synapse: return "Cyberpunk neural network with tech aesthetics"
        }
    }
    
    var icon: String {
        switch self {
        case .firewatch: return "mountain.2.fill"
        case .synapse: return "brain.head.profile"
        }
    }
}

// MARK: - Firewatch Namespace

/// All Firewatch-specific types are namespaced here to avoid conflicts with Synapse system
enum Firewatch {
    
    // MARK: - Story System Types
    
    /// The narrative backbone of the Firewatch experience
    struct StoryChapter: Identifiable, Codable {
        let id: String
        let chapterNumber: Int
        let title: String
        let subtitle: String
        let unlockRequirement: StoryUnlock
        var isUnlocked: Bool
        var isCompleted: Bool
        var storyBeats: [StoryBeat]  // Made mutable to allow marking beats as seen
        
        init(
            id: String,
            chapterNumber: Int,
            title: String,
            subtitle: String,
            unlockRequirement: StoryUnlock,
            storyBeats: [StoryBeat]
        ) {
            self.id = id
            self.chapterNumber = chapterNumber
            self.title = title
            self.subtitle = subtitle
            self.unlockRequirement = unlockRequirement
            self.isUnlocked = false
            self.isCompleted = false
            self.storyBeats = storyBeats
        }
    }
    
    enum StoryUnlock: Codable, Equatable {
        case automatic
        case lookutsCompleted(count: Int)
        case domainMastered(domain: String)
        case trailMiles(amount: Int)
        case daysActive(count: Int)
        case wildfireDefeated
        
        var description: String {
            switch self {
            case .automatic: return "Unlocked"
            case .lookutsCompleted(let count): return "Complete \(count) lookouts"
            case .domainMastered(let domain): return "Master \(domain)"
            case .trailMiles(let amount): return "Earn \(amount) trail miles"
            case .daysActive(let count): return "Study for \(count) days"
            case .wildfireDefeated: return "Survive a wildfire crisis"
            }
        }
    }
    
    struct StoryBeat: Identifiable, Codable {
        let id: String
        let trigger: StoryTrigger
        let speaker: String  // "Ranger", "Radio", "Journal", etc.
        let dialogue: String
        let timestamp: String?  // Optional timestamp like "DAY 1 - 08:30"
        var hasBeenSeen: Bool
        
        init(id: String, trigger: StoryTrigger, speaker: String, dialogue: String, timestamp: String? = nil) {
            self.id = id
            self.trigger = trigger
            self.speaker = speaker
            self.dialogue = dialogue
            self.timestamp = timestamp
            self.hasBeenSeen = false
        }
    }
    
    enum StoryTrigger: Codable, Equatable {
        case chapterStart
        case firstLookout
        case perfectClear
        case firstMistake
        case streakMilestone(days: Int)
        case wildfireStart
        case wildfireDefeated
        case domainComplete
        case examReady
        case custom(String)
    }
    
    struct StoryContext {
        var lookutsCompleted: Int
        var totalXP: Int
        var studyStreak: Int
        var bossesDefeated: Int
        var domainsMastered: Int
        var perfectClears: Int
        
        static let empty = StoryContext(
            lookutsCompleted: 0,
            totalXP: 0,
            studyStreak: 0,
            bossesDefeated: 0,
            domainsMastered: 0,
            perfectClears: 0
        )
    }
}

// MARK: - Color Palette

struct FirewatchColors {
    // Primary sunset palette
    static let sunset = Color(red: 0.976, green: 0.392, blue: 0.239)        // #F96440
    static let sunsetGlow = Color(red: 1.0, green: 0.545, blue: 0.239)     // #FF8B3D
    static let goldenHour = Color(red: 0.976, green: 0.718, blue: 0.239)   // #F9B73D
    
    // Forest greens
    static let forestDark = Color(red: 0.165, green: 0.278, blue: 0.235)   // #2A473C
    static let forestMid = Color(red: 0.278, green: 0.455, blue: 0.373)    // #47745F
    static let pineGreen = Color(red: 0.341, green: 0.541, blue: 0.439)    // #578A70
    
    // Sky and atmosphere
    static let skyBlue = Color(red: 0.384, green: 0.639, blue: 0.749)      // #62A3BF
    static let horizonPurple = Color(red: 0.420, green: 0.341, blue: 0.525) // #6B5786
    static let twilight = Color(red: 0.286, green: 0.220, blue: 0.380)     // #493861
    
    // Earth tones
    static let sandstone = Color(red: 0.894, green: 0.780, blue: 0.647)    // #E4C7A5
    static let trailDust = Color(red: 0.698, green: 0.596, blue: 0.486)    // #B2987C
    static let rockGray = Color(red: 0.525, green: 0.525, blue: 0.529)     // #868687
    
    // Backgrounds
    static let paperLight = Color(red: 0.957, green: 0.945, blue: 0.918)   // #F4F1EA
    static let paperWarm = Color(red: 0.918, green: 0.902, blue: 0.867)    // #EAE6DD
    static let nightSky = Color(red: 0.094, green: 0.106, blue: 0.141)     // #181B24
    
    // Accent states
    static let fireOrange = Color(red: 0.976, green: 0.392, blue: 0.239)   // #F96440
    static let campfireGlow = Color(red: 1.0, green: 0.647, blue: 0.0)     // #FFA500
    static let emberRed = Color(red: 0.831, green: 0.212, blue: 0.133)     // #D43622
}

struct SynapseColors {
    // Cyber palette (existing)
    static let neonOrange = Color(red: 1.0, green: 0.65, blue: 0.0)
    static let electricBlue = Color(red: 0.0, green: 0.78, blue: 1.0)
    static let matrixGreen = Color(red: 0.0, green: 1.0, blue: 0.33)
    static let darkBg = Color(red: 0.059, green: 0.059, blue: 0.059)
    static let gridGray = Color(red: 0.15, green: 0.15, blue: 0.15)
}

// MARK: - Theme Manager

@Observable
class ThemeManager {
    var currentTheme: AppThemeMode {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: "app_theme")
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: "app_theme"),
           let theme = AppThemeMode(rawValue: saved) {
            self.currentTheme = theme
        } else {
            self.currentTheme = .firewatch  // Default to Firewatch
        }
    }
    
    func toggleTheme() {
        currentTheme = currentTheme == .firewatch ? .synapse : .firewatch
    }
    
    // MARK: - Contextual Colors
    
    var primaryAccent: Color {
        currentTheme == .firewatch ? FirewatchColors.sunset : SynapseColors.neonOrange
    }
    
    var secondaryAccent: Color {
        currentTheme == .firewatch ? FirewatchColors.goldenHour : SynapseColors.electricBlue
    }
    
    var background: Color {
        currentTheme == .firewatch ? FirewatchColors.nightSky : SynapseColors.darkBg
    }
    
    var cardBackground: Color {
        currentTheme == .firewatch ? FirewatchColors.forestDark : SynapseColors.gridGray
    }
    
    var successColor: Color {
        currentTheme == .firewatch ? FirewatchColors.pineGreen : SynapseColors.matrixGreen
    }
    
    var textPrimary: Color {
        currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    var textSecondary: Color {
        currentTheme == .firewatch ? FirewatchColors.sandstone : Color.white.opacity(0.7)
    }
    
    // MARK: - Terminology
    
    var nodeLabel: String {
        currentTheme == .firewatch ? "Lookout" : "Node"
    }
    
    var xpLabel: String {
        currentTheme == .firewatch ? "Trail Miles" : "XP"
    }
    
    var shardsLabel: String {
        currentTheme == .firewatch ? "Fire Tokens" : "Data Shards"
    }
    
    var questLabel: String {
        currentTheme == .firewatch ? "Daily Patrol" : "Daily Quest"
    }
    
    var achievementLabel: String {
        currentTheme == .firewatch ? "Ranger Badge" : "Achievement"
    }
    
    var bossLabel: String {
        currentTheme == .firewatch ? "Wildfire Crisis" : "Boss Encounter"
    }
}

// MARK: - Firewatch Story Content

extension Firewatch {
    static let storyChapters: [StoryChapter] = [
        // CHAPTER 1: First Day
        StoryChapter(
            id: "ch1_arrival",
            chapterNumber: 1,
            title: "First Day on the Job",
            subtitle: "Welcome to Shoshone National Forest",
            unlockRequirement: .automatic,
            storyBeats: [
                StoryBeat(
                    id: "ch1_welcome",
                    trigger: .chapterStart,
                    speaker: "Ranger Delilah",
                    dialogue: "Hey there, rookie! Welcome to Shoshone. You're our new fire lookout for the summer. Don't worry—I'll guide you through the ropes. Your first job? Get familiar with the area. Each lookout tower represents a section of pharmacy knowledge you'll need to master. Think of it as... learning the terrain.",
                    timestamp: "DAY 1 - 08:00"
                ),
                StoryBeat(
                    id: "ch1_first_lookout",
                    trigger: .firstLookout,
                    speaker: "Ranger Delilah",
                    dialogue: "Nice! You just completed your first lookout check. Every question you answer is like marking a trail—it helps you navigate this wilderness of pharmacy knowledge. Keep it up, and you'll be a certified ranger before you know it.",
                    timestamp: "DAY 1 - 09:15"
                ),
                StoryBeat(
                    id: "ch1_mistake",
                    trigger: .firstMistake,
                    speaker: "Ranger Delilah",
                    dialogue: "Hey, don't beat yourself up. Even experienced rangers miss things. That's why we have breach protocols—when you spot something wrong, you mark it and come back to study it later. Those red markers on your map? Those are your growth opportunities.",
                    timestamp: nil
                )
            ]
        ),
        
        // CHAPTER 2: The Routine
        StoryChapter(
            id: "ch2_routine",
            chapterNumber: 2,
            title: "Finding Your Rhythm",
            subtitle: "Days 3-7",
            unlockRequirement: .daysActive(count: 3),
            storyBeats: [
                StoryBeat(
                    id: "ch2_routine_start",
                    trigger: .chapterStart,
                    speaker: "Journal Entry",
                    dialogue: "Day 3. I'm starting to get the hang of this. The forest is beautiful up here—endless trees, golden sunsets. Delilah says consistency is key. She's been a ranger for 15 years, knows every trail by heart. I want to be like that with pharmacy.",
                    timestamp: "DAY 3 - 19:30"
                ),
                StoryBeat(
                    id: "ch2_streak",
                    trigger: .streakMilestone(days: 7),
                    speaker: "Ranger Delilah",
                    dialogue: "Seven days straight! You're committed, I'll give you that. Most rookies quit by day three. The forest rewards those who show up every day. So does the PTCB exam. Keep this pace, and you'll see real progress.",
                    timestamp: "DAY 7 - 10:00"
                )
            ]
        ),
        
        // CHAPTER 3: Storm Clouds
        StoryChapter(
            id: "ch3_challenges",
            chapterNumber: 3,
            title: "Storm Clouds Gathering",
            subtitle: "The First Wildfire",
            unlockRequirement: .lookutsCompleted(count: 20),
            storyBeats: [
                StoryBeat(
                    id: "ch3_warning",
                    trigger: .chapterStart,
                    speaker: "Radio Broadcast",
                    dialogue: "[STATIC] All lookouts, this is base. We've got lightning strikes in Sector 1. High winds, low humidity. Wildfire risk is extreme. Stay sharp and report any smoke. [STATIC]",
                    timestamp: "DAY 12 - 14:00"
                ),
                StoryBeat(
                    id: "ch3_wildfire_start",
                    trigger: .wildfireStart,
                    speaker: "Ranger Delilah",
                    dialogue: "Alright rookie, this is it. A wildfire outbreak—ten rapid-fire questions, no breaks. This is what all that training was for. Stay calm, trust your knowledge, and let's save this forest. You've got this.",
                    timestamp: nil
                ),
                StoryBeat(
                    id: "ch3_wildfire_victory",
                    trigger: .wildfireDefeated,
                    speaker: "Ranger Delilah",
                    dialogue: "You did it! The fire's contained. That was intense, but you handled it like a pro. This is exactly the kind of pressure you'll face on exam day. And now you know—you can handle it.",
                    timestamp: nil
                )
            ]
        ),
        
        // CHAPTER 4: Mastery
        StoryChapter(
            id: "ch4_mastery",
            chapterNumber: 4,
            title: "Deep Knowledge",
            subtitle: "Mastering the Sectors",
            unlockRequirement: .domainMastered(domain: "any"),
            storyBeats: [
                StoryBeat(
                    id: "ch4_domain_master",
                    trigger: .domainComplete,
                    speaker: "Ranger Delilah",
                    dialogue: "I'm impressed. You've completely mastered this sector. Every trail, every landmark—you know it all. That's the difference between a rookie and a ranger: deep, unshakeable knowledge. Keep going. Three more sectors to master.",
                    timestamp: nil
                )
            ]
        ),
        
        // CHAPTER 5: The Long Summer
        StoryChapter(
            id: "ch5_journey",
            chapterNumber: 5,
            title: "The Long Summer",
            subtitle: "Reflections and Growth",
            unlockRequirement: .trailMiles(amount: 5000),
            storyBeats: [
                StoryBeat(
                    id: "ch5_reflection",
                    trigger: .chapterStart,
                    speaker: "Journal Entry",
                    dialogue: "I've hiked thousands of miles through these knowledge trails. Each question is a step forward. The sunsets up here are incredible—orange and purple skies that make you feel small but purposeful. I came here to learn, but I'm leaving transformed.",
                    timestamp: "DAY 45 - 20:00"
                )
            ]
        ),
        
        // CHAPTER 6: Exam Ready
        StoryChapter(
            id: "ch6_finale",
            chapterNumber: 6,
            title: "The Final Test",
            subtitle: "Are You Ready?",
            unlockRequirement: .wildfireDefeated,
            storyBeats: [
                StoryBeat(
                    id: "ch6_exam_ready",
                    trigger: .examReady,
                    speaker: "Ranger Delilah",
                    dialogue: "You've done it. Every sector mastered, every wildfire contained. You're ready for the real thing—the PTCB exam. When you sit down in that testing center, remember this summer. Remember the trails you've walked, the challenges you've overcome. You're not a rookie anymore. You're a ranger. Now go show them what you've learned.",
                    timestamp: "DAY 90 - 08:00"
                )
            ]
        )
    ]
}

// MARK: - Firewatch Story Manager

@Observable
class FirewatchStoryManager {
    var chapters: [Firewatch.StoryChapter]
    var unreadBeats: [Firewatch.StoryBeat] = []
    var showingStoryBeat: Firewatch.StoryBeat?
    
    init() {
        // Load from UserDefaults or use default
        if let data = UserDefaults.standard.data(forKey: "firewatch_story_progress"),
           let decoded = try? JSONDecoder().decode([Firewatch.StoryChapter].self, from: data) {
            self.chapters = decoded
        } else {
            self.chapters = Firewatch.storyChapters
            // Unlock first chapter automatically
            if chapters.indices.contains(0) {
                chapters[0].isUnlocked = true
            }
        }
    }
    
    func trigger(_ trigger: Firewatch.StoryTrigger, context: Firewatch.StoryContext) {
        var hasNewBeats = false
        
        for chapterIndex in chapters.indices {
            // Check unlock requirements
            if !chapters[chapterIndex].isUnlocked && checkUnlock(chapters[chapterIndex].unlockRequirement, context: context) {
                chapters[chapterIndex].isUnlocked = true
                hasNewBeats = true
            }
            
            // Check for triggered story beats
            for beatIndex in chapters[chapterIndex].storyBeats.indices {
                let beat = chapters[chapterIndex].storyBeats[beatIndex]
                if !beat.hasBeenSeen && beat.trigger == trigger && chapters[chapterIndex].isUnlocked {
                    chapters[chapterIndex].storyBeats[beatIndex].hasBeenSeen = true
                    unreadBeats.append(beat)
                    hasNewBeats = true
                }
            }
        }
        
        if hasNewBeats {
            saveProgress()
        }
    }
    
    func checkUnlock(_ requirement: Firewatch.StoryUnlock, context: Firewatch.StoryContext) -> Bool {
        switch requirement {
        case .automatic:
            return true
        case .lookutsCompleted(let count):
            return context.lookutsCompleted >= count
        case .domainMastered:
            return context.domainsMastered > 0
        case .trailMiles(let amount):
            return context.totalXP >= amount
        case .daysActive(let count):
            return context.studyStreak >= count
        case .wildfireDefeated:
            return context.bossesDefeated > 0
        }
    }
    
    func showNextBeat() {
        if !unreadBeats.isEmpty {
            showingStoryBeat = unreadBeats.removeFirst()
        }
    }
    
    func dismissCurrentBeat() {
        showingStoryBeat = nil
        saveProgress()
    }
    
    private func saveProgress() {
        if let encoded = try? JSONEncoder().encode(chapters) {
            UserDefaults.standard.set(encoded, forKey: "firewatch_story_progress")
        }
    }
    
    func resetStory() {
        chapters = Firewatch.storyChapters
        unreadBeats.removeAll()
        showingStoryBeat = nil
        if chapters.indices.contains(0) {
            chapters[0].isUnlocked = true
        }
        saveProgress()
    }
}

// MARK: - Firewatch Story Beat View

struct FirewatchStoryBeatView: View {
    let beat: Firewatch.StoryBeat
    let onDismiss: () -> Void
    
    @State private var opacity: Double = 0
    @State private var scale: CGFloat = 0.95
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.85)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Timestamp (if present)
                if let timestamp = beat.timestamp {
                    Text(timestamp)
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundStyle(FirewatchColors.goldenHour)
                        .padding(.bottom, 16)
                }
                
                // Speaker label
                HStack(spacing: 8) {
                    Circle()
                        .fill(FirewatchColors.sunset)
                        .frame(width: 8, height: 8)
                    
                    Text(beat.speaker.uppercased())
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundStyle(FirewatchColors.sunset)
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                // Dialogue
                Text(beat.dialogue)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .foregroundStyle(FirewatchColors.paperLight)
                    .lineSpacing(8)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 24)
                
                // Continue button
                Button(action: onDismiss) {
                    HStack {
                        Text("Continue")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(FirewatchColors.sunset)
                    )
                }
                .shadow(color: FirewatchColors.sunset.opacity(0.4), radius: 12, y: 4)
            }
            .padding(28)
            .frame(maxWidth: 500)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(FirewatchColors.forestDark)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(FirewatchColors.sunset.opacity(0.3), lineWidth: 2)
                    )
            )
            .shadow(color: .black.opacity(0.6), radius: 30, y: 15)
            .padding(.horizontal, 20)
            .scaleEffect(scale)
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                opacity = 1
                scale = 1
            }
        }
    }
}

// MARK: - Firewatch Story Library View

struct FirewatchStoryLibraryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var storyManager: FirewatchStoryManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                FirewatchColors.nightSky.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Your Story")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundStyle(FirewatchColors.paperLight)
                            
                            Text("The journey through Shoshone")
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                                .foregroundStyle(FirewatchColors.sandstone)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                        
                        // Chapters
                        ForEach(storyManager.chapters) { chapter in
                            FirewatchStoryChapterCard(chapter: chapter)
                        }
                        
                        // Reset button
                        Button(action: {
                            storyManager.resetStory()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "arrow.counterclockwise")
                                Text("Reset Story Progress")
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                            }
                            .foregroundStyle(FirewatchColors.sunset)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(FirewatchColors.sunset.opacity(0.4), lineWidth: 1.5)
                            )
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                    }
                    .padding(.bottom, 40)
                }
            }
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(FirewatchColors.sunset)
                }
            }
        }
    }
}

struct FirewatchStoryChapterCard: View {
    let chapter: Firewatch.StoryChapter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("CHAPTER \(chapter.chapterNumber)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundStyle(FirewatchColors.goldenHour)
                
                Spacer()
                
                if !chapter.isUnlocked {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 12))
                        .foregroundStyle(FirewatchColors.rockGray)
                } else if chapter.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(FirewatchColors.pineGreen)
                }
            }
            
            Text(chapter.title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(chapter.isUnlocked ? FirewatchColors.paperLight : FirewatchColors.rockGray)
            
            Text(chapter.subtitle)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundStyle(chapter.isUnlocked ? FirewatchColors.sandstone : FirewatchColors.rockGray.opacity(0.7))
            
            if !chapter.isUnlocked {
                HStack(spacing: 6) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 10))
                    Text(chapter.unlockRequirement.description)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                }
                .foregroundStyle(FirewatchColors.rockGray)
                .padding(.top, 4)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(chapter.isUnlocked ? FirewatchColors.forestDark : FirewatchColors.forestDark.opacity(0.5))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            chapter.isUnlocked ? FirewatchColors.sunset.opacity(0.3) : FirewatchColors.rockGray.opacity(0.2),
                            lineWidth: 1.5
                        )
                )
        )
        .padding(.horizontal, 20)
    }
}

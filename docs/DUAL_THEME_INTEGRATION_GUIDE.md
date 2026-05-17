# Dual Theme System Integration Guide

## Overview

Synapse PTCE features **two complete narrative experiences** that share the same core learning engine. Users can switch between themes to experience the same pharmacy exam prep through different narrative lenses.

---

## The Two Themes

### 🏔️ Firewatch Mode
**Aesthetic:** Warm wilderness adventure with sunset colors and forest tones  
**Story:** You're a fire lookout ranger in Shoshone National Forest  
**Personality:** Naturalistic, contemplative, story-driven  

**Terminology:**
- Lookouts (instead of Nodes)
- Trail Miles (instead of XP)
- Fire Tokens (instead of Data Shards)
- Ranger Badges (instead of Achievements)
- Wildfire Crisis (instead of Boss Encounter)

**Color Palette:**
- Sunset oranges (#F96440)
- Forest greens (#2A473C, #47745F)
- Sky blues (#62A3BF)
- Earth tones (#E4C7A5, #B2987C)
- Paper backgrounds (#F4F1EA)

**Story Structure:** Chapter-based with event-driven dialogue
- 6 chapters unlock based on gameplay milestones
- Story beats triggered by actions (first lookout, mistakes, streaks)
- Character: Ranger Delilah provides guidance via radio

---

### 🧠 Synapse Mode
**Aesthetic:** Cyberpunk neural network with neon accents and grid visuals  
**Story:** You're a System Architect rebuilding a wiped medical database  
**Personality:** Technical, methodical, mystery-driven  

**Terminology:**
- Nodes
- XP
- Data Shards
- Achievements
- Boss Encounter

**Color Palette:**
- Neon orange (#FFA600)
- Electric blue (#00C7FF)
- Matrix green (#00FF54)
- Dark backgrounds (#0F0F0F)
- Grid grays (#262626)

**Story Structure:** Linear progression with stability milestones
- 20 story beats unlock at 5% stability intervals (5%, 10%, 15%, ... 100%)
- Story beats triggered by % progress
- Character: DR_CALLOWAY mystery unfolds through fragments

---

## File Architecture

### FirewatchTheme.swift
**Purpose:** Firewatch-specific types and UI  
**Key Components:**
- `AppThemeMode` enum - Global theme switcher (.firewatch or .synapse)
- `Firewatch` namespace - All Firewatch types live here
  - `Firewatch.StoryBeat`
  - `Firewatch.StoryChapter`
  - `Firewatch.StoryTrigger`
  - `Firewatch.StoryContext`
  - `Firewatch.StoryUnlock`
- `FirewatchColors` struct
- `FirewatchStoryManager` class
- `FirewatchStoryBeatView`
- `FirewatchStoryLibraryView`
- `ThemeManager` class (uses AppThemeMode)

### StoryManager.swift
**Purpose:** Synapse story system  
**Key Components:**
- `StoryBeat` struct (no namespace - original)
  - `triggerPercent: Int` (5, 10, 15, ..., 100)
  - `title: String`
  - `lines: [String]`
- `StoryManager` enum (static methods)
  - `beats: [StoryBeat]` - All 20 beats
  - `nextBeat(stabilityScore:shownCount:)` - Returns next beat

### PersistenceModels.swift
**Purpose:** Core data models  
**Key Components:**
- `SystemRank` enum - XP-based progression ranks
- `MasteryLevel` enum - Per-domain mastery states
- `Theme` enum - Color scheme selector (amber, cobalt, emerald, crimson)

**⚠️ Important:** `Theme` (color schemes) is different from `AppThemeMode` (Firewatch vs Synapse)

---

## How to Integrate Both Systems

### 1. Theme Selection

```swift
import SwiftUI

struct ContentView: View {
    @State private var themeManager = ThemeManager()
    @State private var firewatchStory = FirewatchStoryManager()
    @State private var synapseBeatsShown = 0
    
    var body: some View {
        VStack {
            if themeManager.currentTheme == .firewatch {
                // Firewatch UI
                FirewatchMainView(
                    themeManager: themeManager,
                    storyManager: firewatchStory
                )
            } else {
                // Synapse UI
                SynapseMainView(
                    themeManager: themeManager,
                    synapseBeatsShown: $synapseBeatsShown
                )
            }
        }
    }
}
```

### 2. Using Firewatch Story System

```swift
// Initialize story manager
let firewatchStory = FirewatchStoryManager()

// Build context from user stats
let context = Firewatch.StoryContext(
    lookutsCompleted: userStats.questsCompleted,
    totalXP: userStats.totalXP,
    studyStreak: userStats.currentStreak,
    bossesDefeated: userStats.bossWins,
    domainsMastered: userStats.domainsAtMastery,
    perfectClears: userStats.perfectRuns
)

// Trigger story beats based on gameplay events
firewatchStory.trigger(.firstLookout, context: context)
firewatchStory.trigger(.streakMilestone(days: 7), context: context)
firewatchStory.trigger(.wildfireDefeated, context: context)

// Show pending story beats
if let beat = firewatchStory.showingStoryBeat {
    FirewatchStoryBeatView(beat: beat) {
        firewatchStory.dismissCurrentBeat()
    }
}
```

### 3. Using Synapse Story System

```swift
// Track shown beats
@State private var synapseBeatsShown = 0

// Calculate stability (0-1000)
let stability = calculateStability() // Your logic here

// Check for next beat
if let beat = StoryManager.nextBeat(
    stabilityScore: stability,
    shownCount: synapseBeatsShown
) {
    // Show beat
    SynapseStoryBeatView(beat: beat) {
        synapseBeatsShown += 1
    }
}
```

### 4. Dynamic UI Terminology

```swift
// Use ThemeManager for contextual labels
Text(themeManager.nodeLabel)          // "Lookout" or "Node"
Text(themeManager.xpLabel)            // "Trail Miles" or "XP"
Text(themeManager.shardsLabel)        // "Fire Tokens" or "Data Shards"
Text(themeManager.questLabel)         // "Daily Patrol" or "Daily Quest"
Text(themeManager.achievementLabel)   // "Ranger Badge" or "Achievement"
Text(themeManager.bossLabel)          // "Wildfire Crisis" or "Boss Encounter"

// Use contextual colors
.foregroundStyle(themeManager.primaryAccent)    // Sunset or Neon Orange
.background(themeManager.cardBackground)        // Forest or Grid
```

### 5. Theme Switching

```swift
struct SettingsView: View {
    @Bindable var themeManager: ThemeManager
    
    var body: some View {
        VStack {
            Picker("Theme", selection: $themeManager.currentTheme) {
                ForEach(AppThemeMode.allCases, id: \.self) { mode in
                    HStack {
                        Image(systemName: mode.icon)
                        Text(mode.displayName)
                    }
                    .tag(mode)
                }
            }
            .pickerStyle(.segmented)
            
            Text(themeManager.currentTheme.description)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
```

---

## Namespace Conflict Prevention

### ❌ WRONG - Ambiguous Types

```swift
// Compiler error: 'StoryBeat' is ambiguous
let beat: StoryBeat = ...

// Compiler error: 'StoryManager' is ambiguous  
let manager: StoryManager = ...
```

### ✅ CORRECT - Explicit Namespacing

```swift
// Firewatch story beat
let firewatchBeat: Firewatch.StoryBeat = ...
let firewatchManager = FirewatchStoryManager()

// Synapse story beat
let synapseBeat: StoryBeat = ... // Original, no namespace
let nextBeat = StoryManager.nextBeat(...) // Enum, not class
```

---

## Story Triggers Comparison

### Firewatch Triggers
Event-driven, can fire multiple times:
- `.chapterStart` - Chapter unlocked
- `.firstLookout` - First question answered
- `.perfectClear` - All questions correct in session
- `.firstMistake` - First wrong answer
- `.streakMilestone(days: Int)` - Streak achievement
- `.wildfireStart` - Boss encounter started
- `.wildfireDefeated` - Boss defeated
- `.domainComplete` - Domain mastered
- `.examReady` - Ready for real exam
- `.custom(String)` - Custom events

### Synapse Triggers
Progress-driven, fires once per milestone:
- 5% stability (300 XP)
- 10% stability (600 XP)
- 15% stability (900 XP)
- ... every 5% ...
- 100% stability (6000 XP)

---

## Data Persistence

### Firewatch Story Progress
**UserDefaults Key:** `"firewatch_story_progress"`  
**Data Type:** `[Firewatch.StoryChapter]` encoded as JSON  
**Contains:**
- Chapter unlock states
- Story beat viewed flags
- Chapter completion status

### Synapse Story Progress
**UserDefaults Key:** `"synapse_beats_shown"` (your implementation)  
**Data Type:** `Int`  
**Contains:**
- Number of beats already shown (0-20)

### Theme Selection
**UserDefaults Key:** `"app_theme"`  
**Data Type:** `String` (AppThemeMode.rawValue)  
**Values:** `"FIREWATCH"` or `"SYNAPSE"`

---

## Testing Both Systems

```swift
import Testing

@Suite("Dual Theme System Tests")
struct DualThemeTests {
    
    @Test("Theme manager switches correctly")
    func themeSwitching() {
        let manager = ThemeManager()
        
        manager.currentTheme = .firewatch
        #expect(manager.nodeLabel == "Lookout")
        #expect(manager.xpLabel == "Trail Miles")
        
        manager.currentTheme = .synapse
        #expect(manager.nodeLabel == "Node")
        #expect(manager.xpLabel == "XP")
    }
    
    @Test("Firewatch story triggers work")
    func firewatchTriggers() {
        let story = FirewatchStoryManager()
        let context = Firewatch.StoryContext(
            lookutsCompleted: 1,
            totalXP: 100,
            studyStreak: 1,
            bossesDefeated: 0,
            domainsMastered: 0,
            perfectClears: 0
        )
        
        story.trigger(.firstLookout, context: context)
        #expect(story.unreadBeats.count > 0)
    }
    
    @Test("Synapse story progresses by stability")
    func synapseProgression() {
        let beat5 = StoryManager.nextBeat(stabilityScore: 50, shownCount: 0)
        #expect(beat5?.triggerPercent == 5)
        
        let beat10 = StoryManager.nextBeat(stabilityScore: 100, shownCount: 1)
        #expect(beat10?.triggerPercent == 10)
    }
}
```

---

## Common Pitfalls

### 1. Using Wrong Story System
```swift
// ❌ Mixing systems
if themeManager.currentTheme == .firewatch {
    // Don't use Synapse StoryManager here!
    let beat = StoryManager.nextBeat(...) // WRONG
}

// ✅ Correct
if themeManager.currentTheme == .firewatch {
    firewatchStory.trigger(.firstLookout, context: context)
} else {
    if let beat = StoryManager.nextBeat(...) { ... }
}
```

### 2. Forgetting Namespace
```swift
// ❌ Ambiguous
func showBeat(_ beat: StoryBeat) { ... }

// ✅ Explicit
func showFirewatchBeat(_ beat: Firewatch.StoryBeat) { ... }
func showSynapseBeat(_ beat: StoryBeat) { ... }
```

### 3. Confusing Theme Enums
```swift
// Theme (color schemes) - from PersistenceModels.swift
let colorScheme: Theme = .amber

// AppThemeMode (narrative mode) - from FirewatchTheme.swift
let narrativeMode: AppThemeMode = .firewatch

// These are DIFFERENT enums!
```

---

## Future Enhancement Ideas

1. **Unified Story Protocol**
   - Create `protocol NarrativeSystem` both systems conform to
   - Allows generic story handling

2. **Theme-Specific Analytics**
   - Track which theme users prefer
   - A/B test engagement by theme

3. **Cross-Theme Achievements**
   - "Complete exam in both themes"
   - "Switch themes 10 times"

4. **Theme-Aware Animations**
   - Firewatch: Gentle fades, organic motion
   - Synapse: Sharp snaps, digital glitches

5. **Custom Theme Creation**
   - Let users create hybrid themes
   - Mix Firewatch colors with Synapse terminology

---

## Questions?

**Q: Can I add more themes?**  
A: Yes! Add new cases to `AppThemeMode`, create a namespace (e.g., `enum Cyberpunk { ... }`), and extend `ThemeManager`.

**Q: How do I sync story progress across devices?**  
A: Replace `UserDefaults` with iCloud `NSUbiquitousKeyValueStore` or CloudKit.

**Q: Can themes share story content?**  
A: Technically yes, but it breaks immersion. Keep themes narratively distinct.

**Q: What if I want a theme without a story?**  
A: Add a case to `AppThemeMode` and return empty arrays for story content.

---

**Last Updated:** May 5, 2026  
**Maintainer:** Synapse PTCE Team

# Quick Reference: Dual Theme System

## Type Quick Lookup

### ✅ Use These (Firewatch)
```swift
let mode: AppThemeMode = .firewatch
let beat: Firewatch.StoryBeat
let chapter: Firewatch.StoryChapter
let trigger: Firewatch.StoryTrigger
let context: Firewatch.StoryContext
let unlock: Firewatch.StoryUnlock
let manager = FirewatchStoryManager()
let view = FirewatchStoryBeatView(...)
let library = FirewatchStoryLibraryView(...)
let card = FirewatchStoryChapterCard(...)
```

### ✅ Use These (Synapse - Original)
```swift
let beat: StoryBeat  // No namespace
let nextBeat = StoryManager.nextBeat(...)  // Enum
```

### ✅ Use These (Shared)
```swift
let themeManager = ThemeManager()
let firewatchColor = FirewatchColors.sunset
let synapseColor = SynapseColors.neonOrange
let colorScheme: Theme = .amber  // Different from AppThemeMode!
```

---

## Common Patterns

### Theme-Aware UI
```swift
Text(themeManager.nodeLabel)      // Auto-switches terminology
  .foregroundStyle(themeManager.primaryAccent)  // Auto-switches colors
```

### Story Triggering (Firewatch)
```swift
let context = Firewatch.StoryContext(
    lookutsCompleted: stats.quests,
    totalXP: stats.xp,
    studyStreak: stats.streak,
    bossesDefeated: stats.bosses,
    domainsMastered: stats.mastered,
    perfectClears: stats.perfect
)
firewatchStory.trigger(.firstLookout, context: context)
```

### Story Checking (Synapse)
```swift
if let beat = StoryManager.nextBeat(
    stabilityScore: stability,
    shownCount: beatsShown
) {
    // Show beat
}
```

---

## Quick Import Guide

```swift
// In your view files
import SwiftUI

// Use theme manager
@State private var themeManager = ThemeManager()

// Use Firewatch story (if in Firewatch mode)
@State private var firewatchStory = FirewatchStoryManager()

// Use Synapse story (if in Synapse mode)
@State private var synapseBeatsShown = 0
```

---

## Error Prevention Checklist

Before committing code, verify:

- [ ] Using `AppThemeMode` not `AppTheme`
- [ ] Using `Firewatch.StoryBeat` not bare `StoryBeat` for Firewatch
- [ ] Using `FirewatchStoryManager` not `StoryManager` class
- [ ] Theme switcher checks both `.firewatch` and `.synapse` cases
- [ ] Story triggers match current theme mode
- [ ] UserDefaults keys don't conflict ("firewatch_story_progress" vs "synapse_beats_shown")
- [ ] Views use `themeManager` for contextual colors/labels

---

## File Ownership

| Type | File | Notes |
|------|------|-------|
| `AppThemeMode` | FirewatchTheme.swift | Global theme selector |
| `Firewatch.*` | FirewatchTheme.swift | All Firewatch types |
| `FirewatchColors` | FirewatchTheme.swift | Nature color palette |
| `FirewatchStoryManager` | FirewatchTheme.swift | Chapter-based story |
| `StoryBeat` (original) | StoryManager.swift | Synapse story beat |
| `StoryManager` enum | StoryManager.swift | Synapse progression |
| `SynapseColors` | FirewatchTheme.swift | Tech color palette |
| `ThemeManager` | FirewatchTheme.swift | Contextual theming |
| `Theme` enum | PersistenceModels.swift | Color schemes (amber/cobalt) |
| `SystemRank` | PersistenceModels.swift | XP ranks |
| `MasteryLevel` | PersistenceModels.swift | Domain mastery |

---

## Color Reference

### Firewatch Colors
```swift
FirewatchColors.sunset        // #F96440 - Primary accent
FirewatchColors.sunsetGlow    // #FF8B3D
FirewatchColors.goldenHour    // #F9B73D
FirewatchColors.forestDark    // #2A473C - Card backgrounds
FirewatchColors.pineGreen     // #578A70 - Success
FirewatchColors.skyBlue       // #62A3BF
FirewatchColors.paperLight    // #F4F1EA - Text
FirewatchColors.sandstone     // #E4C7A5 - Secondary text
FirewatchColors.nightSky      // #181B24 - Background
```

### Synapse Colors
```swift
SynapseColors.neonOrange      // #FFA600 - Primary accent
SynapseColors.electricBlue    // #00C7FF
SynapseColors.matrixGreen     // #00FF54 - Success
SynapseColors.darkBg          // #0F0F0F - Background
SynapseColors.gridGray        // #262626 - Card backgrounds
```

---

## Terminology Mapping

| Concept | Firewatch | Synapse |
|---------|-----------|---------|
| Learning unit | Lookout | Node |
| Progress points | Trail Miles | XP |
| Currency | Fire Tokens | Data Shards |
| Daily task | Daily Patrol | Daily Quest |
| Award | Ranger Badge | Achievement |
| Challenge | Wildfire Crisis | Boss Encounter |

Access via: `themeManager.nodeLabel`, `themeManager.xpLabel`, etc.

---

## Story Triggers

### Firewatch (Event-Based)
```swift
.chapterStart
.firstLookout
.perfectClear
.firstMistake
.streakMilestone(days: 7)
.wildfireStart
.wildfireDefeated
.domainComplete
.examReady
.custom("event_name")
```

### Synapse (Progress-Based)
- 5%, 10%, 15%, 20%, 25%, 30%, 35%, 40%, 45%, 50%
- 55%, 60%, 65%, 70%, 75%, 80%, 85%, 90%, 95%, 100%

---

## One-Liners for Common Tasks

```swift
// Toggle theme
themeManager.toggleTheme()

// Get theme-appropriate color
let accent = themeManager.primaryAccent

// Check current theme
if themeManager.currentTheme == .firewatch { ... }

// Show Firewatch story beat
if let beat = firewatchStory.showingStoryBeat {
    FirewatchStoryBeatView(beat: beat) {
        firewatchStory.dismissCurrentBeat()
    }
}

// Get next Synapse beat
if let beat = StoryManager.nextBeat(stabilityScore: 500, shownCount: 5) { ... }

// Reset Firewatch story
firewatchStory.resetStory()
```

---

**Need More?** See DUAL_THEME_INTEGRATION_GUIDE.md for complete documentation.

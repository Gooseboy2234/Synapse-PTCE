# 🎨 Before & After — UI Transformation Examples

## Example 1: Node Completion Screen

### BEFORE (Hardcoded Synapse)
```swift
struct NodeCompletionView: View {
    var body: some View {
        VStack {
            Text("Node Complete!")
                .foregroundStyle(.white)
            
            Text("XP Earned: 50")
                .foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.0))
            
            Text("Data Shards: +5")
                .foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.0))
        }
        .background(Color(red: 0.059, green: 0.059, blue: 0.059))
    }
}
```

### AFTER (Theme-Aware)
```swift
struct NodeCompletionView: View {
    @Environment(ThemeManager.self) private var themeManager
    
    var body: some View {
        VStack {
            // Title adapts: "Lookout Complete!" or "Node Complete!"
            Text("\(themeManager.nodeLabel) Complete!")
                .foregroundStyle(themeManager.textPrimary)
            
            // Label adapts: "Trail Miles" or "XP"
            Text("\(themeManager.xpLabel) Earned: 50")
                .foregroundStyle(themeManager.primaryAccent)
            
            // Label adapts: "Fire Tokens" or "Data Shards"
            Text("\(themeManager.shardsLabel): +5")
                .foregroundStyle(themeManager.primaryAccent)
        }
        .background(themeManager.background)
    }
}
```

**Result in Firewatch Mode:**
- Title: "Lookout Complete!"
- XP becomes: "Trail Miles Earned: 50"
- Shards becomes: "Fire Tokens: +5"
- Background: Deep forest dark (#2A473C)
- Accent: Sunset orange (#F96440)
- Text: Warm paper white (#F4F1EA)

**Result in Synapse Mode:**
- Title: "Node Complete!"
- XP: "XP Earned: 50"
- Shards: "Data Shards: +5"
- Background: Dark gray (#0F0F0F)
- Accent: Neon orange (#FFA500)
- Text: Pure white

---

## Example 2: Achievement Card

### BEFORE
```swift
struct AchievementCard: View {
    let achievement: Achievement
    
    var body: some View {
        VStack {
            Image(systemName: achievement.type.icon)
                .foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.0))
            
            Text(achievement.type.title)
                .foregroundStyle(.white)
            
            Text(achievement.type.description)
                .foregroundStyle(Color.white.opacity(0.7))
        }
    }
}
```

### AFTER
```swift
struct AchievementCard: View {
    let achievement: Achievement
    var themeManager: ThemeManager
    
    var body: some View {
        VStack {
            // Icon adapts: "figure.hiking" (Firewatch) or "figure.walk" (Synapse)
            Image(systemName: achievement.type.achievementIcon(for: themeManager.currentTheme))
                .foregroundStyle(themeManager.primaryAccent)
            
            // Title adapts: "First Patrol" (Firewatch) or "First Steps" (Synapse)
            Text(achievement.type.title(for: themeManager.currentTheme))
                .foregroundStyle(themeManager.textPrimary)
            
            // Description adapts based on theme
            Text(achievement.type.achievementDescription(for: themeManager.currentTheme))
                .foregroundStyle(themeManager.textSecondary)
        }
    }
}
```

**Result in Firewatch Mode:**
- Achievement: "First Patrol" (instead of "First Steps")
- Icon: figure.hiking (instead of figure.walk)
- Description: "Complete your first lookout survey"
- Colors: Sunset orange on forest dark

**Result in Synapse Mode:**
- Achievement: "First Steps"
- Icon: figure.walk
- Description: "Complete your first node"
- Colors: Neon orange on dark gray

---

## Example 3: Stats Display

### BEFORE
```swift
HStack {
    VStack {
        Text("5,420")
        Text("XP")
    }
    
    VStack {
        Text("156")
        Text("Data Shards")
    }
    
    VStack {
        Text("12")
        Text("Rank")
    }
}
.foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.0))
```

### AFTER
```swift
@Environment(ThemeManager.self) private var themeManager

HStack {
    VStack {
        Text("5,420")
        Text(themeManager.xpLabel)  // "Trail Miles" or "XP"
    }
    
    VStack {
        Text("156")
        Text(themeManager.shardsLabel)  // "Fire Tokens" or "Data Shards"
    }
    
    VStack {
        Text("12")
        Text(themeManager.currentTheme == .firewatch ? "Ranger Rank" : "Network Rank")
    }
}
.foregroundStyle(themeManager.primaryAccent)
```

**Firewatch Mode Display:**
```
5,420          156              12
Trail Miles    Fire Tokens      Ranger Rank
```

**Synapse Mode Display:**
```
5,420    156            12
XP       Data Shards    Network Rank
```

---

## Example 4: Daily Quest Card

### BEFORE
```swift
VStack {
    Text("Daily Quest")
    Text("Answer 10 Questions Correctly")
    ProgressView(value: 7, total: 10)
    Text("Reward: 100 XP, 10 Shards")
}
```

### AFTER
```swift
@Environment(ThemeManager.self) private var themeManager

VStack {
    Text(themeManager.questLabel)  // "Daily Patrol" or "Daily Quest"
    Text("Answer 10 Questions Correctly")
    ProgressView(value: 7, total: 10)
        .tint(themeManager.primaryAccent)
    Text("Reward: 100 \(themeManager.xpLabel), 10 \(themeManager.shardsLabel)")
}
```

**Firewatch Mode:**
- Header: "Daily Patrol"
- Reward: "100 Trail Miles, 10 Fire Tokens"
- Progress bar: Sunset orange

**Synapse Mode:**
- Header: "Daily Quest"
- Reward: "100 XP, 10 Data Shards"
- Progress bar: Neon orange

---

## Example 5: Boss Encounter Screen

### BEFORE
```swift
struct BossEncounterView: View {
    var body: some View {
        VStack {
            Text("⚠️ BOSS ENCOUNTER")
            Text("Defeat the Domain Boss")
            Text("10 questions, no mistakes!")
            
            Button("Begin Battle") { }
                .foregroundStyle(.black)
                .background(Color.red)
        }
    }
}
```

### AFTER
```swift
struct BossEncounterView: View {
    @Environment(ThemeManager.self) private var themeManager
    
    var bossTitle: String {
        themeManager.currentTheme == .firewatch 
            ? "🔥 WILDFIRE CRISIS" 
            : "⚠️ BOSS ENCOUNTER"
    }
    
    var bossDescription: String {
        themeManager.currentTheme == .firewatch
            ? "Contain the wildfire"
            : "Defeat the Domain Boss"
    }
    
    var buttonLabel: String {
        themeManager.currentTheme == .firewatch
            ? "Begin Response"
            : "Begin Battle"
    }
    
    var body: some View {
        VStack {
            Text(bossTitle)
                .foregroundStyle(themeManager.primaryAccent)
            
            Text(bossDescription)
                .foregroundStyle(themeManager.textPrimary)
            
            Text("10 questions, no mistakes!")
                .foregroundStyle(themeManager.textSecondary)
            
            Button(buttonLabel) { }
                .foregroundStyle(.black)
                .background(themeManager.primaryAccent)
        }
        .background(themeManager.cardBackground)
    }
}
```

**Firewatch Mode:**
```
🔥 WILDFIRE CRISIS
Contain the wildfire
10 questions, no mistakes!
[Begin Response]
```
- Warm orange (#F96440) accent
- Forest dark (#2A473C) background
- Natural language ("response" vs "battle")

**Synapse Mode:**
```
⚠️ BOSS ENCOUNTER
Defeat the Domain Boss
10 questions, no mistakes!
[Begin Battle]
```
- Neon orange accent
- Dark gray background
- Tech language

---

## Example 6: Tutorial Card

### BEFORE
```swift
struct TutorialCard: View {
    var body: some View {
        VStack {
            Image(systemName: "map.fill")
            Text("The Network Map")
            Text("Navigate nodes organized by domain...")
        }
        .background(Color(red: 0.059, green: 0.059, blue: 0.059))
    }
}
```

### AFTER
```swift
struct TutorialCard: View {
    let step: TutorialStep
    var themeManager: ThemeManager
    
    var body: some View {
        VStack {
            Image(systemName: step.icon)
                .foregroundStyle(themeManager.primaryAccent)
            
            Text(step.title(theme: themeManager.currentTheme))
                .foregroundStyle(themeManager.textPrimary)
            
            Text(step.description(theme: themeManager.currentTheme))
                .foregroundStyle(themeManager.textSecondary)
        }
        .background(themeManager.cardBackground)
    }
}
```

**Firewatch Mode:**
```
[map icon]
The Forest Map
The forest map shows all lookout towers organized by sector...
```

**Synapse Mode:**
```
[map icon]
The Network Map
Navigate nodes organized by domain...
```

---

## Example 7: Settings Section

### BEFORE
```swift
Section("Game Stats") {
    HStack {
        Text("Total XP")
        Spacer()
        Text("5,420")
    }
    
    HStack {
        Text("Data Shards")
        Spacer()
        Text("156")
    }
    
    HStack {
        Text("Nodes Completed")
        Spacer()
        Text("48")
    }
}
```

### AFTER
```swift
@Environment(ThemeManager.self) private var themeManager

Section(themeManager.currentTheme == .firewatch ? "Ranger Stats" : "Game Stats") {
    HStack {
        Text("Total \(themeManager.xpLabel)")
        Spacer()
        Text("5,420")
    }
    
    HStack {
        Text(themeManager.shardsLabel)
        Spacer()
        Text("156")
    }
    
    HStack {
        Text("\(themeManager.nodeLabel)s Completed")
        Spacer()
        Text("48")
    }
}
```

**Firewatch Mode:**
```
RANGER STATS
Total Trail Miles          5,420
Fire Tokens                  156
Lookouts Completed            48
```

**Synapse Mode:**
```
GAME STATS
Total XP                   5,420
Data Shards                  156
Nodes Completed               48
```

---

## Example 8: Story Beat Display

### NEW FEATURE
```swift
@Environment(StoryManager.self) private var storyManager

// After user completes first node
let context = StoryContext(
    lookutsCompleted: 1,
    totalXP: 50,
    studyStreak: 1,
    bossesDefeated: 0,
    domainsMastered: 0,
    perfectClears: 0
)

storyManager.trigger(.firstLookout, context: context)

// Later, when there's a new story beat:
if let beat = storyManager.showingStoryBeat {
    StoryBeatView(beat: beat) {
        storyManager.dismissCurrentBeat()
    }
}
```

**Displays:**
```
DAY 1 - 09:15

● RANGER DELILAH

Nice! You just completed your first lookout check. 
Every question you answer is like marking a trail—it 
helps you navigate this wilderness of pharmacy knowledge. 
Keep it up, and you'll be a certified ranger before you 
know it.

[Continue →]
```

---

## Color Comparison Chart

### Firewatch Palette
```
Background:     #181B24 (nightSky)      ████████
Card:           #2A473C (forestDark)    ████████
Primary Accent: #F96440 (sunset)        ████████
Secondary:      #F9B73D (goldenHour)    ████████
Success:        #578A70 (pineGreen)     ████████
Text Primary:   #F4F1EA (paperLight)    ████████
Text Secondary: #E4C7A5 (sandstone)     ████████
```

### Synapse Palette
```
Background:     #0F0F0F (darkBg)        ████████
Card:           #262626 (gridGray)      ████████
Primary Accent: #FFA500 (neonOrange)    ████████
Secondary:      #00C7FF (electricBlue)  ████████
Success:        #00FF54 (matrixGreen)   ████████
Text Primary:   #FFFFFF (white)         ████████
Text Secondary: #B3B3B3 (gray)          ████████
```

---

## Typography Examples

### Firewatch Style
```
CHAPTER 1                    [11pt Monospace Bold, Golden Hour]
First Day on the Job         [20pt Rounded Bold, Paper Light]
Welcome to Shoshone          [15pt Rounded Regular, Sandstone]
```

### Synapse Style
```
CHAPTER 1                    [11pt Monospace Bold, Neon Orange]
First Steps                  [20pt Rounded Bold, White]
Begin your neural journey    [15pt Rounded Regular, Gray]
```

---

## Icon Transformations

| Feature | Synapse Icon | Firewatch Icon |
|---------|-------------|----------------|
| First Achievement | `figure.walk` | `figure.hiking` |
| XP/Miles | `sparkles` | `sparkles` |
| Shards/Tokens | `diamond.fill` | `fireplace.fill` |
| Boss/Crisis | `shield.fill` | `flame.circle.fill` |
| Streak | `flame.fill` | `flame.fill` |
| Domain 1 | `pills.fill` | `cross.vial.fill` |
| Domain 2 | `building.columns.fill` | `scroll.fill` |
| Complete | `checkmark.circle.fill` | `checkmark.seal.fill` |

---

## Toggle Implementation

```swift
// In Settings
struct ThemeToggle: View {
    @Environment(ThemeManager.self) private var themeManager
    
    var body: some View {
        Section("Appearance") {
            Picker("Theme", selection: Binding(
                get: { themeManager.currentTheme },
                set: { themeManager.currentTheme = $0 }
            )) {
                ForEach(AppTheme.allCases, id: \.self) { theme in
                    HStack {
                        Image(systemName: theme.icon)
                        Text(theme.displayName)
                    }
                    .tag(theme)
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

**Renders as:**
```
┌─────────────────────────────┐
│ [Firewatch] | [Synapse Neural] │  ← Segmented Picker
└─────────────────────────────┘
Warm wilderness adventure with 
narrative storytelling
```

---

## Summary

### What Changes Automatically:
✅ All colors (background, text, accents)  
✅ All terminology (XP → Trail Miles, etc.)  
✅ All achievement names  
✅ All tutorial text  
✅ All icons  
✅ All UI labels  

### What You Need to Update:
1. Replace hardcoded colors with `themeManager.primaryAccent` etc.
2. Replace hardcoded strings with `themeManager.xpLabel` etc.
3. Use `achievement.type.title(for: theme)` for achievements
4. Use `step.title(theme:)` for tutorials

### Migration Pattern:
```swift
// OLD
.foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.0))
Text("XP: \(xp)")
Text(achievement.type.title)

// NEW
.foregroundStyle(themeManager.primaryAccent)
Text("\(themeManager.xpLabel): \(xp)")
Text(achievement.type.title(for: themeManager.currentTheme))
```

---

**That's the transformation!** From hardcoded Synapse to flexible Firewatch/Synapse dual-theme system. 🎨🔥

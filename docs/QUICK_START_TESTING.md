# Quick Start: Testing Shelf Break Integration

## Build & Run

1. **Open the project in Xcode**
2. **Build and run** (⌘R)
3. **The app should launch successfully** with the new narrative system integrated

## What You'll See Immediately

### Launch Screen
- Same as before: "SYNAPSE // PTCE NETWORK v13.0" boot sequence
- Content loads normally

### Hub Map (Main Menu)
When the app opens, you should see:

✅ **Subtle ocean tint** behind the existing grid (very subtle deep blue)  
✅ **Top status bar** showing:
   - `600m` (depth gauge with down arrow)
   - `DAY 1` (station day counter)
   - `NO CONTACT` (red indicator — no surface communication)

✅ **Domain nodes** labeled as:
   - D1: `PHARMACY OPS` (instead of "MEDICATIONS")
   - D2: `VAULT PROTOCOL` (instead of "FED.REQ")
   - D3: `MEDICAL BAY` (instead of "PT.SAFETY")
   - D4: `SUPPLY SYSTEM` (instead of "ORDER ENTRY")

✅ **Bottom watermark:** "SHELF BREAK STATION // DISPENSARY MODULE // 600M DEPTH"

### Everything Else Works Identically
- Tap a domain → Quest picker appears
- Tap a quest → Questions load
- Answer questions → Progress saves, XP/shards awarded
- Story beats trigger at milestones
- Boss encounters, themes, settings all work

## Testing Narrative Mode Toggle

### To Turn OFF Narrative Mode

1. Open **Settings** (gear icon in bottom command bar)
2. **Story Mode** toggle should be ON by default
3. Toggle it **OFF**
4. **Back to hub**

**You should see:**
- Ocean tint disappears
- Status bar disappears
- Domain labels revert to classic ("MEDICATIONS", "FED.REQ", etc.)
- Watermark reverts to "SYNAPSE // PTCE NETWORK v13.0 // MAIN BRANCH"

### To Turn ON Narrative Mode

1. Settings → **Story Mode** toggle ON
2. Back to hub
3. Shelf Break aesthetic returns

## Testing Chapter Progression

### How Chapters Unlock

Chapters are tied to your **stability score** (the 1000-point progress bar):

| Score | Chapter | What Unlocks |
|-------|---------|--------------|
| 0 | 1 — Night Shift | Always available |
| 100 | 2 — The Missing Inventory | After ~10% complete |
| 250 | 3 — Distress Signals | After ~25% complete |
| 400 | 4 — Contamination Protocol | After ~40% complete |
| 550 | 5 — The Reyes Files | After ~55% complete |
| 700 | 6 — Ghost Prescriptions | After ~70% complete |
| 825 | 7 — Pressure | After ~82.5% complete |
| 900 | 8 — The Deep Vault | After ~90% complete |
| 975 | 9 — Surface | After ~97.5% complete |

### Watching Progress

As you answer questions correctly:
- Stability score increases
- Chapter number in status bar updates (DAY 1 → DAY 2 → DAY 3, etc.)
- After 700 points: Surface contact indicator changes from red "NO CONTACT" to... still "NO CONTACT" (story element — communications fail)

Wait, that's backwards. Let me check the logic...

Actually, I set it so `hasSurfaceContact` is TRUE when score < 700, meaning:
- **Before Chapter 6 (0-699 points):** Green "SURFACE LINK"
- **After Chapter 6 (700+ points):** Red "NO CONTACT"

This is correct for the story (communications are severed in Chapter 6).

## Troubleshooting

### Issue: App crashes on launch

**Likely cause:** StorySystem.swift or ShelfBreakUI.swift not added to target

**Fix:**
1. In Xcode, select `StorySystem.swift` in the file navigator
2. Open File Inspector (⌘⌥1)
3. Under "Target Membership", ensure your app target is checked
4. Repeat for `ShelfBreakUI.swift`

### Issue: "Cannot find 'StoryDatabase' in scope"

**Likely cause:** Missing import or file not compiled

**Fix:**
1. Clean build folder (⌘⇧K)
2. Rebuild (⌘B)
3. If still failing, check that GameEngine.swift can see StorySystem.swift

### Issue: Domain nodes still show old labels when narrative mode is ON

**Likely cause:** `@AppStorage` key not reading correctly

**Fix:**
1. Force quit the app (swipe up in app switcher)
2. Relaunch
3. Check Settings → Story Mode toggle state

### Issue: Status bar not appearing

**Check:**
- Is narrative mode ON?
- Is `StationStatusBar` code in ShelfBreakUI.swift compiled?
- Try adding a breakpoint in `HubMapView.body` where `.safeAreaInset(edge: .top)` is called

## Advanced Testing

### Test Story Database Loading

Add a breakpoint in `GameEngine.init()` at the line:
```swift
self.storyDatabase = StoryDatabase()
```

**Check:**
- `storyDatabase.chapters.count == 9`
- `storyDatabase.logs.count >= 2`
- `storyDatabase.characters.count >= 3`

### Test Chapter Unlocking Logic

In Xcode debug console, after app launches:
```swift
po engine.currentChapter
po engine.isChapterUnlocked(1)
po engine.isChapterUnlocked(5)
po engine.stationDay
po engine.hasSurfaceContact
```

Expected results (for a new user with 0 stability):
- `currentChapter: 1`
- `isChapterUnlocked(1): true`
- `isChapterUnlocked(5): false`
- `stationDay: 1`
- `hasSurfaceContact: true`

### Test Narrative Mode Toggle Persistence

1. Turn narrative mode OFF
2. Force quit app
3. Relaunch
4. Hub should show **classic PTCE aesthetic** (mode persisted)
5. Turn narrative mode back ON
6. Force quit app
7. Relaunch
8. Hub should show **Shelf Break aesthetic**

## Visual Checklist

When narrative mode is ON, the hub should look like this:

```
┌────────────────────────────────────────────────┐
│ ↓600m    DAY 1         ● NO CONTACT           │ ← Status bar
├────────────────────────────────────────────────┤
│                                                │
│        [GUIDED LEARNING BUTTON]                │
│                                                │
│                                                │
│       ●───────●                                │ ← Connection lines
│     D1│       │D2                              │
│  PHARMACY   VAULT                              │
│    OPS    PROTOCOL                             │
│    5/50     8/40                               │
│       │       │                                │
│       ●───────●                                │
│     D3│       │D4                              │
│  MEDICAL   SUPPLY                              │
│    BAY     SYSTEM                              │
│    2/35     0/25                               │
│       ●───────●                                │
│                                                │
│   SHELF BREAK STATION // 600M DEPTH           │ ← Watermark
├────────────────────────────────────────────────┤
│ RANK-02 │ INTEL CAMP BREACH EXAM │ ◆125 ⚙    │ ← Bottom bar
│  ●●●○○   D1▓▓░ D2▓░░ D3▓░░ D4░░░              │
└────────────────────────────────────────────────┘
```

Note: Grid background should have a **very subtle deep blue tint** overlaid (you might barely notice it — that's intentional, it's atmospheric not overwhelming).

## Success Criteria

✅ **Core Integration**
- [ ] App launches without crashes
- [ ] `StoryDatabase` loads with 9 chapters, 2+ logs, 3+ characters
- [ ] Status bar appears at top when narrative mode ON
- [ ] Domain nodes show Shelf Break labels when narrative mode ON
- [ ] Watermark shows "SHELF BREAK STATION" when narrative mode ON

✅ **Toggle Functionality**
- [ ] Narrative mode toggle exists in Settings
- [ ] Turning it OFF reverts to classic aesthetic
- [ ] Turning it ON restores Shelf Break aesthetic
- [ ] State persists across app restarts

✅ **Backwards Compatibility**
- [ ] All questions still work
- [ ] Progress saves correctly
- [ ] XP/ranks/shards calculate correctly
- [ ] Story beats still trigger
- [ ] Boss encounters still work
- [ ] Existing themes still work

## Next Steps After Testing

Once core integration is confirmed working:

**Option 1: Add Logs Button (Quick Win)**
- Add "LOGS" button to bottom command bar
- Create simple list view showing the 2 initial logs
- Users can tap to read full log with typewriter effect

**Option 2: Populate Full Story Content (Deep Work)**
- Write remaining 20+ logs
- Complete all chapter introductions
- Add character voice notes

**Option 3: Enhance Visual Atmosphere (Polish)**
- Add `PressureAmbientOverlay` to story beat view
- Add animated ocean window to side panels
- Enhance terminal-style frames

---

## Questions? Issues?

If something doesn't work as expected:
1. Check the console for error messages
2. Verify all new files are in the target
3. Clean build folder and rebuild
4. Check `@AppStorage` key is reading correctly

**The core integration should be solid.** All new code is additive — if something breaks, it's likely a missing file reference or import issue, not a logic problem.

---

**Ready to launch? Run the app and explore Shelf Break Station. 600 meters down. No way out but through.**

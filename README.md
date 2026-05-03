# 💊 Synapse PTCE

> A comprehensive iOS study app for the **Pharmacy Technician Certification Exam (PTCE)** — built with SwiftUI and SwiftData.

---

## 📖 Overview

**Synapse PTCE** is a native iOS study companion designed to help pharmacy technician students master the content tested on the PTCE. The app focuses heavily on **Domain 1: Medications**, using proven learning science — spaced repetition, active recall, and chunking — to build long-term retention.

Whether you're a first-time test-taker or retaking the exam, Synapse PTCE gives you a structured, progressive path from foundational drug stem patterns all the way through high-risk medications and drug interactions.

---

## ✨ Features

### 🔤 Drug Stems
Learn the naming patterns that unlock hundreds of drug names at once. The app covers 25+ PTCE-relevant stems organized by body system, with examples, therapeutic uses, and key clinical points. Progress is tracked automatically as you work through each stem.

### 🃏 Flashcard Mode (Spaced Repetition)
A confidence-based flashcard system inspired by spaced repetition methodology. After each card, rate your recall (Again / Hard / Good / Easy) and the app schedules the next review accordingly — reviewing right before you'd forget for maximum efficiency. Review history and next review dates are persisted via SwiftData.

### 📝 Quiz Mode
Test yourself on stem recognition just like the real PTCE. Each session generates 10 randomized questions: see a drug name, identify its pharmacological class. Immediate feedback and explanations are provided after each answer, with session scores tracked over time.

### 🫀 Body Systems
Browse drugs organized by physiological system (cardiovascular, CNS, respiratory, etc.). Build the mental frameworks that make drug classification feel intuitive rather than memorized.

### ⚠️ High-Risk Medications
Dedicated study section covering the four high-risk categories the PTCE emphasizes:
- **NTI** — Narrow Therapeutic Index drugs
- **High-Alert** — ISMP high-alert medications
- **REMS** — Risk Evaluation and Mitigation Strategies
- **LASA** — Look-Alike / Sound-Alike pairs

### 💊 Drug Interactions
15+ clinically important interactions organized by type (OTC ↔ Rx, herbal ↔ Rx, food ↔ Rx, Rx ↔ Rx), with severity ratings, mechanisms, and patient counseling points.

### 🔍 Universal Drug Search
Look up any drug by name and instantly see its stem, pharmacological class, body system, high-risk status, and known interactions. Includes recent search history and detailed drug profiles.

### 📊 Progress Tracking
SwiftData-powered progress tracking across all study modes — stems viewed, flashcards reviewed, quiz accuracy, and study streaks.

---

## 🧠 Learning Philosophy

The app's study flow is intentionally sequenced to mirror how pharmacy professionals actually learn:

1. **Drug Stems** — Build the foundation. Learn one stem, recognize dozens of drugs.
2. **Flashcards** — Reinforce with spaced repetition. Review right before forgetting.
3. **Quizzes** — Test with active recall. Identify gaps before the real exam does.
4. **Body Systems** — Apply knowledge in physiological context.
5. **High-Risk Meds** — Study what the PTCE emphasizes for patient safety.
6. **Drug Interactions** — Real-world counseling knowledge.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI Framework | SwiftUI |
| Persistence | SwiftData |
| Minimum Target | iOS 17+ |
| Platform | iPhone, iPad, Apple TV (via `TVHubView`) |
| Architecture | MVVM with environment-injected theme |

---

## 🚀 Getting Started

### Requirements
- Xcode 15 or later
- iOS 17+ deployment target
- Swift 5.9+

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Gooseboy2234/Synapse-PTCE.git
   ```

2. Open the project in Xcode:
   ```bash
   open "Synapse PTCE.xcodeproj"
   ```

3. In your main App file, ensure the SwiftData model container includes the learning models:
   ```swift
   .modelContainer(for: [
       LearningProgress.self,
       FlashcardReview.self,
       QuizResult.self
   ])
   ```

4. Build and run on a simulator or device running iOS 17+.

---

## 📁 Project Structure

```
Synapse PTCE/
├── Models
│   ├── MedicationDataModels.swift       # Core data structures (enums, structs)
│   ├── MedicationDatabase.swift         # Full medication database (stems, interactions, high-risk)
│   ├── LearningProgressModels.swift     # SwiftData models for progress tracking
│   ├── PTCEMedicationModels.swift       # PTCE-specific medication models
│   └── PTCEMedicationDatabase.swift     # Extended PTCE medication database
│
├── Views
│   ├── GuidedLearningHub.swift          # Main entry point — 6 learning modes
│   ├── BodySystemsView.swift            # Browse drugs by body system
│   ├── DrugSearchView.swift             # Universal drug search
│   ├── DrugStemsView.swift              # Drug stem study view
│   ├── FlashcardModeView.swift          # Spaced repetition flashcards
│   ├── HighRiskMedicationsView.swift    # NTI / High-Alert / REMS / LASA
│   ├── DrugInteractionsView.swift       # Drug interaction browser
│   ├── StemQuizView.swift               # Stem recognition quiz
│   ├── ConceptualLearningView.swift     # Conceptual learning content
│   ├── SimplifiedLearningViews.swift    # Consolidated study views
│   └── SettingsView.swift               # App settings
│
├── TV
│   ├── TVContentView.swift              # Apple TV root view
│   ├── TVHubView.swift                  # Apple TV hub
│   ├── TVEncounterView.swift            # TV encounter/quiz view
│   ├── TVMapView.swift                  # TV map view
│   └── TVSettingsView.swift             # TV settings view
│
└── Utilities
    ├── StoryManager.swift               # Story/narrative flow manager
    ├── QuickStartIntegration.swift      # Integration helpers
    └── MultiAngle_D*.swift              # Domain content files (D1–D4)
```

---

## 📱 Platform Support

| Platform | Status |
|---|---|
| iPhone (iOS 17+) | ✅ Fully supported |
| iPad | ✅ Fully supported (multitasking) |
| Apple TV | ✅ Supported via `TVHubView` |
| Mac Catalyst | ⚠️ Works, spacing may need tuning |

---

## 🎨 Design System

Synapse PTCE uses a custom `AppTheme` environment object for consistent styling across light and dark mode:

- Color-coded categories (by body system, severity, medication type)
- Monospaced fonts for technical/pharmaceutical labels
- SF Symbols throughout
- Expandable card patterns with spring physics animations
- Grid background motifs for visual consistency

---

## 🤝 Contributing

Contributions are welcome! If you'd like to add more drug stems, expand the medication database, or improve the UI, feel free to open a pull request.

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/more-stems`)
3. Commit your changes
4. Open a pull request

---

## ⚠️ Disclaimer

Synapse PTCE is an educational study tool intended to help students prepare for the PTCE exam. It is **not** a clinical decision support tool and should not be used for actual patient care decisions. Always refer to current, authoritative clinical references for medication information in practice.

---

## 📄 License

This project is currently unlicensed. All rights reserved by the author.

---

*Built to help pharmacy technician students pass the PTCE — and become competent, confident healthcare professionals.* 💊

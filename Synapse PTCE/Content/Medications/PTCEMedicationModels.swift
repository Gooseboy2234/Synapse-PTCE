//
//  PTCEMedicationModels.swift
//  Synapse PTCE
//
//  ⚠️ DEPRECATED - Use MedicationDataModels.swift instead
//  This file contains duplicate type definitions and should be removed from the project
//

/*
 
 THIS FILE HAS BEEN DISABLED TO PREVENT DUPLICATE TYPE DECLARATIONS
 All models are now defined in MedicationDataModels.swift
 
 If you need to delete this file:
 1. Select it in the Project Navigator
 2. Press Delete
 3. Choose "Move to Trash"
 
*/

#if false

import Foundation
import SwiftUI

// MARK: - Body System

enum PTCEBodySystem: String, CaseIterable, Identifiable, Codable {
    case cardiovascular    = "CARDIOVASCULAR"
    case respiratory       = "RESPIRATORY"
    case gastrointestinal  = "GASTROINTESTINAL"
    case endocrine         = "ENDOCRINE"
    case centralNervous    = "CENTRAL_NERVOUS"
    case musculoskeletal   = "MUSCULOSKELETAL"
    case immune            = "IMMUNE_INFECTION"
    case renal             = "RENAL_URINARY"
    case hematologic       = "HEMATOLOGIC"
    case dermatologic      = "DERMATOLOGIC"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .cardiovascular:    return "Cardiovascular System"
        case .respiratory:       return "Respiratory System"
        case .gastrointestinal:  return "Gastrointestinal System"
        case .endocrine:         return "Endocrine System"
        case .centralNervous:    return "Central Nervous System"
        case .musculoskeletal:   return "Musculoskeletal System"
        case .immune:            return "Immune System & Infection"
        case .renal:             return "Renal & Urinary System"
        case .hematologic:       return "Hematologic System"
        case .dermatologic:      return "Dermatologic System"
        }
    }
    
    var icon: String {
        switch self {
        case .cardiovascular:    return "heart.fill"
        case .respiratory:       return "lungs.fill"
        case .gastrointestinal:  return "stomach.fill"
        case .endocrine:         return "circle.hexagongrid.fill"
        case .centralNervous:    return "brain.head.profile"
        case .musculoskeletal:   return "figure.walk"
        case .immune:            return "shield.fill"
        case .renal:             return "drop.fill"
        case .hematologic:       return "drop.circle.fill"
        case .dermatologic:      return "hand.raised.fill"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .cardiovascular:    return Color(red: 0.95, green: 0.22, blue: 0.30)
        case .respiratory:       return Color(red: 0.40, green: 0.72, blue: 1.00)
        case .gastrointestinal:  return Color(red: 1.00, green: 0.65, blue: 0.00)
        case .endocrine:         return Color(red: 0.60, green: 0.35, blue: 0.85)
        case .centralNervous:    return Color(red: 0.30, green: 0.85, blue: 0.55)
        case .musculoskeletal:   return Color(red: 0.85, green: 0.65, blue: 0.40)
        case .immune:            return Color(red: 0.95, green: 0.50, blue: 0.20)
        case .renal:             return Color(red: 0.25, green: 0.60, blue: 0.95)
        case .hematologic:       return Color(red: 0.78, green: 0.15, blue: 0.25)
        case .dermatologic:      return Color(red: 0.90, green: 0.75, blue: 0.60)
        }
    }
}

// MARK: - Drug Stem

struct PTCEDrugStem: Identifiable, Sendable, Hashable {
    let id = UUID()
    let stem: String
    let drugClass: String
    let therapeuticUse: String
    let examples: [String]
    let keyPoint: String
    let systemAffected: PTCEBodySystem
    let pronunciation: String?
    let audioFileName: String?  // For AVFoundation playback
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PTCEDrugStem, rhs: PTCEDrugStem) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - High Risk Category

enum PTCEHighRiskCategory: String, CaseIterable, Identifiable, Codable {
    case narrowTherapeuticIndex = "NTI"
    case highAlert              = "HIGH_ALERT"
    case rems                   = "REMS"
    case lookAlikeSoundAlike    = "LASA"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .narrowTherapeuticIndex: return "Narrow Therapeutic Index (NTI)"
        case .highAlert:              return "High-Alert Medications (ISMP)"
        case .rems:                   return "REMS Programs"
        case .lookAlikeSoundAlike:    return "Look-Alike/Sound-Alike (LASA)"
        }
    }
    
    var description: String {
        switch self {
        case .narrowTherapeuticIndex:
            return "Drugs where the difference between a therapeutic dose and a toxic dose is microscopic."
        case .highAlert:
            return "Medications that can cause devastating harm if used in error (ISMP list)."
        case .rems:
            return "Risk Evaluation and Mitigation Strategy programs mandated by the FDA."
        case .lookAlikeSoundAlike:
            return "Drug name pairs that are easily confused, leading to dangerous errors."
        }
    }
    
    var icon: String {
        switch self {
        case .narrowTherapeuticIndex: return "gauge.with.dots.needle.67percent"
        case .highAlert:              return "exclamationmark.triangle.fill"
        case .rems:                   return "checkmark.shield.fill"
        case .lookAlikeSoundAlike:    return "eyes"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .narrowTherapeuticIndex: return Color(red: 0.95, green: 0.50, blue: 0.20)
        case .highAlert:              return Color(red: 0.95, green: 0.22, blue: 0.30)
        case .rems:                   return Color(red: 0.78, green: 0.42, blue: 1.00)
        case .lookAlikeSoundAlike:    return Color(red: 1.00, green: 0.65, blue: 0.00)
        }
    }
}

// MARK: - High Risk Medication

struct PTCEHighRiskMedication: Identifiable, Sendable, Hashable {
    let id = UUID()
    let genericName: String
    let brandName: String
    let category: PTCEHighRiskCategory
    let drugClass: String
    let therapeuticUse: String
    let riskDescription: String
    let monitoringRequired: String
    let keyPoint: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PTCEHighRiskMedication, rhs: PTCEHighRiskMedication) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Interaction Severity

enum PTCEInteractionSeverity: String, CaseIterable, Identifiable, Codable {
    case contraindicated = "CONTRAINDICATED"
    case major           = "MAJOR"
    case moderate        = "MODERATE"
    case minor           = "MINOR"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .contraindicated: return "Contraindicated"
        case .major:           return "Major"
        case .moderate:        return "Moderate"
        case .minor:           return "Minor"
        }
    }
    
    var description: String {
        switch self {
        case .contraindicated:
            return "NEVER use together. Life-threatening consequences."
        case .major:
            return "Serious interaction. May cause death or hospitalization."
        case .moderate:
            return "May worsen condition or require therapy change."
        case .minor:
            return "Limited clinical significance."
        }
    }
    
    var accentColor: Color {
        switch self {
        case .contraindicated: return Color(red: 0.78, green: 0.15, blue: 0.25)
        case .major:           return Color(red: 0.95, green: 0.22, blue: 0.30)
        case .moderate:        return Color(red: 1.00, green: 0.65, blue: 0.00)
        case .minor:           return Color(red: 1.00, green: 0.85, blue: 0.40)
        }
    }
    
    var icon: String {
        switch self {
        case .contraindicated: return "xmark.octagon.fill"
        case .major:           return "exclamationmark.triangle.fill"
        case .moderate:        return "exclamationmark.circle.fill"
        case .minor:           return "info.circle.fill"
        }
    }
}

// MARK: - Interaction Type

enum PTCEInteractionType: String, CaseIterable, Identifiable, Codable {
    case otcRx      = "OTC_RX"
    case herbalRx   = "HERBAL_RX"
    case foodRx     = "FOOD_RX"
    case rxRx       = "RX_RX"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .otcRx:    return "OTC ↔ Prescription"
        case .herbalRx: return "Herbal ↔ Prescription"
        case .foodRx:   return "Food ↔ Prescription"
        case .rxRx:     return "Prescription ↔ Prescription"
        }
    }
}

// MARK: - Drug Interaction

struct PTCEDrugInteraction: Identifiable, Sendable, Hashable {
    let id = UUID()
    let agent1: String
    let agent2: String
    let interactionType: PTCEInteractionType
    let severity: PTCEInteractionSeverity
    let mechanismDescription: String
    let clinicalConsequence: String
    let patientCounseling: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PTCEDrugInteraction, rhs: PTCEDrugInteraction) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Case Study

struct PTCECaseStudy: Identifiable, Sendable {
    let id = UUID()
    let title: String
    let scenario: String
    let patientInfo: String
    let medicationList: [String]
    let question: String
    let options: [String]
    let correctAnswer: String
    let explanation: String
    let relatedStems: [PTCEDrugStem]
    let difficulty: CaseDifficulty
    
    enum CaseDifficulty: String, Codable {
        case beginner     = "BEGINNER"
        case intermediate = "INTERMEDIATE"
        case advanced     = "ADVANCED"
        
        var displayName: String {
            switch self {
            case .beginner:     return "Beginner"
            case .intermediate: return "Intermediate"
            case .advanced:     return "Advanced"
            }
        }
        
        var accentColor: Color {
            switch self {
            case .beginner:     return .green
            case .intermediate: return .orange
            case .advanced:     return .red
            }
        }
    }
}

// MARK: - Achievement Badge

struct PTCEAchievement: Identifiable, Codable {
    let id = UUID()
    let badgeID: String
    let title: String
    let description: String
    let iconName: String
    let accentColor: String  // Hex color
    let unlockCondition: String
    var isUnlocked: Bool = false
    var unlockedDate: Date?
    
    static let allAchievements: [PTCEAchievement] = [
        PTCEAchievement(badgeID: "stem_master_cardio", title: "Cardio Master", description: "Learned all cardiovascular stems", iconName: "heart.fill", accentColor: "#F23847", unlockCondition: "CARDIO_STEMS_COMPLETE"),
        PTCEAchievement(badgeID: "quiz_perfect_10", title: "Perfect 10", description: "Scored 100% on a stem quiz", iconName: "star.fill", accentColor: "#FFD700", unlockCondition: "QUIZ_PERFECT"),
        PTCEAchievement(badgeID: "flashcard_streak_7", title: "Week Warrior", description: "7-day flashcard streak", iconName: "flame.fill", accentColor: "#FF6B35", unlockCondition: "FLASHCARD_STREAK_7"),
        PTCEAchievement(badgeID: "interaction_expert", title: "Interaction Expert", description: "Viewed all major drug interactions", iconName: "arrow.triangle.2.circlepath", accentColor: "#8E44AD", unlockCondition: "INTERACTIONS_COMPLETE"),
        PTCEAchievement(badgeID: "high_risk_guardian", title: "Safety Guardian", description: "Learned all high-risk medications", iconName: "shield.fill", accentColor: "#E74C3C", unlockCondition: "HIGH_RISK_COMPLETE"),
        PTCEAchievement(badgeID: "stem_completionist", title: "Stem Completionist", description: "Learned all 50+ drug stems", iconName: "checkmark.seal.fill", accentColor: "#27AE60", unlockCondition: "ALL_STEMS_COMPLETE"),
    ]
}

// MARK: - Study Plan

struct PTCEStudyPlan: Identifiable {
    let id = UUID()
    let examDate: Date
    let startDate: Date
    let totalDays: Int
    let dailyTasks: [DailyTask]
    
    struct DailyTask: Identifiable {
        let id = UUID()
        let day: Int
        let date: Date
        let tasks: [Task]
        var isCompleted: Bool = false
        
        struct Task: Identifiable {
            let id = UUID()
            let taskType: TaskType
            let description: String
            var isCompleted: Bool = false
            
            enum TaskType: String {
                case learnStems      = "LEARN_STEMS"
                case flashcards      = "FLASHCARDS"
                case quiz            = "QUIZ"
                case caseStudy       = "CASE_STUDY"
                case interactions    = "INTERACTIONS"
                case highRisk        = "HIGH_RISK"
                case review          = "REVIEW"
            }
        }
    }
    
    static func generate(examDate: Date, startDate: Date = Date()) -> PTCEStudyPlan {
        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: startDate, to: examDate).day ?? 30
        
        var dailyTasks: [DailyTask] = []
        
        for day in 1...days {
            guard let taskDate = calendar.date(byAdding: .day, value: day - 1, to: startDate) else { continue }
            
            var tasks: [DailyTask.Task] = []
            
            // Week 1-2: Foundations
            if day <= 14 {
                tasks.append(DailyTask.Task(taskType: .learnStems, description: "Learn 3-5 new drug stems"))
                tasks.append(DailyTask.Task(taskType: .flashcards, description: "Review 10 flashcards"))
            }
            
            // Week 2-3: Application
            if day > 7 && day <= 21 {
                tasks.append(DailyTask.Task(taskType: .quiz, description: "Complete stem recognition quiz"))
                tasks.append(DailyTask.Task(taskType: .interactions, description: "Study 2-3 drug interactions"))
            }
            
            // Week 3-4: Advanced
            if day > 14 {
                tasks.append(DailyTask.Task(taskType: .highRisk, description: "Study high-risk medications"))
                tasks.append(DailyTask.Task(taskType: .caseStudy, description: "Complete 1 case study"))
            }
            
            // Every day: Review
            tasks.append(DailyTask.Task(taskType: .review, description: "Review 5 flashcards"))
            
            dailyTasks.append(DailyTask(day: day, date: taskDate, tasks: tasks))
        }
        
        return PTCEStudyPlan(examDate: examDate, startDate: startDate, totalDays: days, dailyTasks: dailyTasks)
    }
}
#endif // End of disabled code


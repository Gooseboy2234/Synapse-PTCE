//
//  MedicationDataModels.swift
//  Synapse PTCE
//
//  All data models for D1 Medications learning system
//  Drug Stems, Body Systems, High-Risk Meds, Drug Interactions
//

import Foundation
import SwiftUI

// MARK: - Body System

enum BodySystem: String, CaseIterable, Identifiable, Codable {
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

struct DrugStem: Identifiable, Sendable {
    let id = UUID()
    let stem: String
    let drugClass: String
    let therapeuticUse: String
    let examples: [String]
    let keyPoint: String
    let systemAffected: BodySystem
    
    // Pronunciation helper (optional)
    var pronunciation: String?
}

extension DrugStem {
    static var allStems: [DrugStem] {
        allDrugStems
    }
    
    static func stems(for system: BodySystem) -> [DrugStem] {
        allStems.filter { $0.systemAffected == system }
    }
}

// MARK: - High Risk Category

enum HighRiskCategory: String, CaseIterable, Identifiable, Codable {
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

struct HighRiskMedication: Identifiable, Sendable {
    let id = UUID()
    let genericName: String
    let brandName: String
    let category: HighRiskCategory
    let drugClass: String
    let therapeuticUse: String
    let riskDescription: String
    let monitoringRequired: String
    let keyPoint: String
}

extension HighRiskMedication {
    static var allHighRiskMeds: [HighRiskMedication] {
        allHighRiskMedications
    }
    
    static func medications(for category: HighRiskCategory) -> [HighRiskMedication] {
        allHighRiskMeds.filter { $0.category == category }
    }
}

// MARK: - Interaction Severity

enum InteractionSeverity: String, CaseIterable, Identifiable, Codable {
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

enum InteractionType: String, CaseIterable, Identifiable, Codable {
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

struct DrugInteraction: Identifiable, Sendable {
    let id = UUID()
    let agent1: String
    let agent2: String
    let interactionType: InteractionType
    let severity: InteractionSeverity
    let mechanismDescription: String
    let clinicalConsequence: String
    let patientCounseling: String
}

extension DrugInteraction {
    static var allInteractions: [DrugInteraction] {
        allDrugInteractions
    }
    
    static func interactions(for type: InteractionType) -> [DrugInteraction] {
        allInteractions.filter { $0.interactionType == type }
    }
    
    static func interactions(for severity: InteractionSeverity) -> [DrugInteraction] {
        allInteractions.filter { $0.severity == severity }
    }
}

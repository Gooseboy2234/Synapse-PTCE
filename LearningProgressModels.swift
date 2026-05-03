//
//  LearningProgressModels.swift
//  Synapse PTCE
//
//  SwiftData Models for Tracking D1 Medications Learning Progress
//  Persists everything: stems learned, flashcards reviewed, quiz scores, etc.
//

import Foundation
import SwiftData

// MARK: - Learning Progress (Main Model)

@Model
final class LearningProgress {
    
    // MARK: Drug Stems Progress
    var stemsLearned: Int
    var stemIDsViewed: [String]  // UUIDs of viewed stems
    
    // MARK: Flashcard Progress
    var flashcardsReviewed: Int
    var flashcardDueDate: Date   // Next spaced repetition session
    var flashcardStreak: Int
    
    // MARK: Quiz Progress
    var quizzesCompleted: Int
    var quizCorrectAnswers: Int
    var quizTotalQuestions: Int
    var lastQuizScore: Double
    
    // MARK: Body Systems Progress
    var systemsStudiedRaw: String  // Comma-separated BodySystem rawValues
    
    // MARK: High-Risk Medications Progress
    var highRiskMedsLearned: Int
    var highRiskMedIDsViewed: [String]
    
    // MARK: Drug Interactions Progress
    var interactionsLearned: Int
    var interactionIDsViewed: [String]
    
    // MARK: Search History
    var recentSearches: [String]
    
    // MARK: Overall Stats
    var totalStudyTimeSeconds: Int
    var lastStudyDate: Date
    var studyStreak: Int  // Days in a row
    
    init() {
        stemsLearned = 0
        stemIDsViewed = []
        
        flashcardsReviewed = 0
        flashcardDueDate = Date()
        flashcardStreak = 0
        
        quizzesCompleted = 0
        quizCorrectAnswers = 0
        quizTotalQuestions = 0
        lastQuizScore = 0.0
        
        systemsStudiedRaw = ""
        
        highRiskMedsLearned = 0
        highRiskMedIDsViewed = []
        
        interactionsLearned = 0
        interactionIDsViewed = []
        
        recentSearches = []
        
        totalStudyTimeSeconds = 0
        lastStudyDate = Date()
        studyStreak = 0
    }
    
    // MARK: Computed Properties
    
    var systemsStudied: [BodySystem] {
        systemsStudiedRaw
            .components(separatedBy: ",")
            .compactMap { BodySystem(rawValue: $0.trimmingCharacters(in: .whitespaces)) }
    }
    
    func markSystemStudied(_ system: BodySystem) {
        if !systemsStudied.contains(system) {
            if systemsStudiedRaw.isEmpty {
                systemsStudiedRaw = system.rawValue
            } else {
                systemsStudiedRaw += ",\(system.rawValue)"
            }
        }
    }
    
    var overallAccuracy: Double {
        guard quizTotalQuestions > 0 else { return 0.0 }
        return Double(quizCorrectAnswers) / Double(quizTotalQuestions)
    }
    
    func markStemViewed(_ stemID: UUID) {
        let idString = stemID.uuidString
        if !stemIDsViewed.contains(idString) {
            stemIDsViewed.append(idString)
            stemsLearned += 1
        }
    }
    
    func markHighRiskMedViewed(_ medID: UUID) {
        let idString = medID.uuidString
        if !highRiskMedIDsViewed.contains(idString) {
            highRiskMedIDsViewed.append(idString)
            highRiskMedsLearned += 1
        }
    }
    
    func markInteractionViewed(_ interactionID: UUID) {
        let idString = interactionID.uuidString
        if !interactionIDsViewed.contains(idString) {
            interactionIDsViewed.append(idString)
            interactionsLearned += 1
        }
    }
    
    func addSearch(_ query: String) {
        recentSearches.insert(query, at: 0)
        if recentSearches.count > 20 {
            recentSearches = Array(recentSearches.prefix(20))
        }
    }
    
    func updateStudyStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let lastStudy = calendar.startOfDay(for: lastStudyDate)
        
        let daysBetween = calendar.dateComponents([.day], from: lastStudy, to: today).day ?? 0
        
        if daysBetween == 0 {
            // Same day — no change
            return
        } else if daysBetween == 1 {
            // Consecutive day — increment
            studyStreak += 1
        } else {
            // Streak broken — reset
            studyStreak = 1
        }
        
        lastStudyDate = Date()
    }
}

// MARK: - Flashcard Review Record

@Model
final class FlashcardReview {
    var stemID: String
    var reviewDate: Date
    var confidence: Int  // 1 = Again, 2 = Hard, 3 = Good, 4 = Easy
    var nextReviewDate: Date
    var reviewCount: Int
    
    init(stemID: String, confidence: Int) {
        self.stemID = stemID
        self.reviewDate = Date()
        self.confidence = confidence
        self.reviewCount = 1
        
        // Spaced repetition algorithm (simplified)
        let interval: TimeInterval
        switch confidence {
        case 1: interval = 60 * 5       // 5 minutes
        case 2: interval = 3600          // 1 hour
        case 3: interval = 86400         // 1 day
        case 4: interval = 86400 * 3     // 3 days
        default: interval = 86400
        }
        
        self.nextReviewDate = Date().addingTimeInterval(interval)
    }
}

// MARK: - Quiz Result

@Model
final class QuizResult {
    var quizType: String  // "STEM_RECOGNITION", "INTERACTION_ID", etc.
    var completionDate: Date
    var score: Double
    var totalQuestions: Int
    var correctAnswers: Int
    var timeSpentSeconds: Int
    
    init(quizType: String, score: Double, totalQuestions: Int, correctAnswers: Int, timeSpent: Int) {
        self.quizType = quizType
        self.completionDate = Date()
        self.score = score
        self.totalQuestions = totalQuestions
        self.correctAnswers = correctAnswers
        self.timeSpentSeconds = timeSpent
    }
}

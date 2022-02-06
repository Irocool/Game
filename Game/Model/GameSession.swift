//
//  GameSession.swift
//  Game
//
//  Created by Irina Kuligina on 06.02.2022.
//

import Foundation

class GameSession {
    var date: Date = Date()
    var correctAnswers: Int = 0    // Количество правильных ответов
    var questionsCount: Int        // Количество вопросов
    var currentQuestion: Int = 0 { // Номер текущего вопроса
        didSet {
            NotificationCenter.default.post(name: Notification.Name(Notifications.currentQuestion.rawValue), object: nil)
        }
    }
    var score: Int = 0             // Количество денег
    var usedHints: [Hints] = []    // Использованные подсказки
    
    init(questionsCount: Int) {
        self.questionsCount = questionsCount
    }
}

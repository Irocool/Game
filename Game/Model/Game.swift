//
//  Game.swift
//  Game
//
//  Created by Irina Kuluigna on 02.02.2022.
//

import Foundation

enum GameResultState {
    case win
    case lose
}

class Game {
    static var shared = Game()
    var session: GameSession?
    private let resultsCaretaker = ResultsCaretaker()
    
    private init() {}
    
    private(set) lazy var results: [GameResult] = {
       return resultsCaretaker.loadResults()
    }() {
        didSet {
            resultsCaretaker.saveResults(results: results)
        }
    }
    
    func end(with state: GameResultState) {
        if let session = Game.shared.session {
            let gameResult = GameResult(date: session.date, correctAnswersCount: session.correctAnswers, usedHintsCount: session.usedHints.count, score: session.score)
            results.append(gameResult)
        }
        
        Game.shared.session = nil
    }
    
    func clearResults() {
        results = []
    }
}

enum Hints {
    case half
    case quiz
    case phoneCall
    case tryToAnswer
}

class GameSession {
    var date: Date = Date()
    var correctAnswers: Int = 0  // Количество правильных ответов
    var questionsCount: Int
    var score: Int = 0           // Количество денег
    var usedHints: [Hints] = []  // Использованные подсказки
    
    init(questionsCount: Int) {
        self.questionsCount = questionsCount
    }
}

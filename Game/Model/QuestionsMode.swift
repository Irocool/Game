//
//  QuestionsMode.swift
//  Game
//
//  Created by Irina Kuligina on 05.02.2022.
//

enum QuestionsOrder: Int {
    case serial
    case random
}

protocol QuestionsOrderStrategy: AnyObject {
    func loadQuestions() -> [Question]
}

class QuestionsSerialOrderStrategy: QuestionsOrderStrategy {
    func loadQuestions() -> [Question] {
        let questions = QuestionsStorage.shared.get()
        
        return questions
    }
}

class QuestionsRandomOrderStrategy: QuestionsOrderStrategy {
    func loadQuestions() -> [Question] {
        var questions = QuestionsStorage.shared.get()
        questions.shuffle()
        
        return questions
    }
}

class QuestionsInOrderFacade {
    let mode: QuestionsOrder = Game.shared.questionsMode
    
    private lazy var strategy: QuestionsOrderStrategy = {
        switch mode {
        case .serial:
            return QuestionsSerialOrderStrategy()
        case .random:
            return QuestionsRandomOrderStrategy()
        }
    }()
    
    func get() -> [Question] {
        return strategy.loadQuestions()
    }
}


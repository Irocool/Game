//
//  QuestionModeCaretaker.swift
//  Game
//
//  Created by Irina Kuligina on 06.02.2022.
//
import Foundation

class QuestionModeCaretaker {
    private let defaults = UserDefaults.standard
    private let key = "GameQuestionsMode"
    
    func saveMode(mode: QuestionsOrder) {
        defaults.setValue(mode.rawValue, forKey: key)
    }
    
    func loadMode() -> QuestionsOrder {
        let modeIndex = defaults.integer(forKey: key)
        let mode = QuestionsOrder(rawValue: modeIndex) ?? .serial
        
        return mode
    }
}

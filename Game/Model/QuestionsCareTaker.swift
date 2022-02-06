//
//  QuestionsCareTaker.swift
//  Game
//
//  Created by Irina Kuligina on 05.02.2022.
//

import Foundation

class QuestionCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "GameQuestions"
    
    func saveQuestions(questions: [Question]) {
        do {
            let data: Memento = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Question] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}

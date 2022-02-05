//
//  ResultsCaretaker.swift
//  Game
//
//  Created by Irina Kuligina on 02.02.2022.
//

import Foundation

class ResultsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "WhoWantsToBeAmillionaireResults"
    
    func saveResults(results: [GameResult]) {
        do {
            let data: Memento = try encoder.encode(results)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadResults() -> [GameResult] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([GameResult].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}

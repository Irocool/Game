//
//  Result.swift
//  Game
//
//  Created by Irina Kuligina on 02.02.2022.
//

import Foundation

struct GameResult {
    var date: Date
    var correctAnswersCount: Int
    var usedHintsCount: Int
    var score: Int
}

extension GameResult: Codable {}

typealias Memento = Data

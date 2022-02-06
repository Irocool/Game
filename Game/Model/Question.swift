//
//  Question.swift
//  Game
//
//  Created by Irina Kuligina on 19.02.2021.
//

struct Question {
    let id: Int
    let text: String
    let answers: [String]
    let correctAnswer: String
    var correctAnswerIndex: Int? {
        return answers.firstIndex(of: correctAnswer)
    }
}
extension Question: Codable {}

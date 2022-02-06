//
//  QuestionsStorage.swift
//  Game
//
//  Created by Irina Kuligina on 05.02.2022.
//

import Foundation

class QuestionsStorage {
    static var shared = QuestionsStorage()
        
    private let questionsCaretaker = QuestionCaretaker()
    private lazy var questions: [Question] = {
        let loadedQuestions = questionsCaretaker.loadQuestions()
        if loadedQuestions.isEmpty {
            questionsCaretaker.saveQuestions(questions: defaultQuestions())
            return defaultQuestions()
        }
        
        return loadedQuestions
    }() {
        didSet {
            questionsCaretaker.saveQuestions(questions: questions)
        }
    }
    private let defaultQuestions = {
        return [
            Question(id: 1, text: "Как характеризуют человека, одетого во всё новое?", answers: ["одет с иголочки", "одет с напёрсточка", "одет с булавочки", "одет с ниточки"], correctAnswer: "одет с иголочки"),
            Question(id: 2, text: "Из чего сделаны ядра орехов, которые грызёт белка в \"Сказке о царе Салтане\"?", answers: ["янтарь", "изумруд", "рубин", "гранит"], correctAnswer: "изумруд"),
            Question(id: 3, text: "Кто занимался подготовкой волокна к прядению?", answers: ["говорун", "прядильщик", "балабол", "трепач"], correctAnswer: "трепач"),
            Question(id: 4, text: "Как жители Лондона прозвали свой метрополитен?", answers: ["труба", "червяк", "горло", "вена"], correctAnswer: "труба"),
            Question(id: 5, text: "Где изображён герб на 10-рублёвой монете?", answers: ["на гурте", "на канте", "на реверсе", "на аверсе"], correctAnswer: "на аверсе")]
    }
    
    private init() {}
    
    func add(question: Question) {
        questions.append(question)
    }
    
    func remove(at: Int) {
        questions.remove(at: at)
    }
    
    func get() -> [Question] {
        if questions.isEmpty {
            questions = defaultQuestions()
                
        }
        
        return questions
    }
    
    func size() -> Int {
        return questions.count
    }
    
    func isEmpty() -> Bool {
        return questions.isEmpty
    }
    
    func getLastIndex() -> Int? {
        return questions.last?.id
    }
}

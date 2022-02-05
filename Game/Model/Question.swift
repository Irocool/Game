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

class QuestionsStorage {
    static var shared = QuestionsStorage()
    
    private init() {}
    
    var getData = {
    return [
        Question(id: 1, text: "Как характеризуют человека, одетого во всё новое?", answers: ["одет с иголочки", "одет с напёрсточка", "одет с булавочки", "одет с ниточки"], correctAnswer: "одет с иголочки"),
        Question(id: 2, text: "Из чего сделаны ядра орехов, которые грызёт белка в \"Сказке о царе Салтане\"?", answers: ["янтарь", "изумруд", "рубин", "гранит"], correctAnswer: "изумруд"),
        Question(id: 3, text: "Кто занимался подготовкой волокна к прядению?", answers: ["болтун", "фразёр", "балабол", "трепач"], correctAnswer: "трепач"),
        Question(id: 4, text: "Как жители Лондона прозвали свой метрополитен?", answers: ["труба", "червяк", "горло", "вена"], correctAnswer: "труба"),
        Question(id: 5, text: "Где изображён герб на 10-рублёвой монете?", answers: ["на гурте", "на канте", "на реверсе", "на аверсе"], correctAnswer: "на аверсе"),
       
    ]
    
    }()
}


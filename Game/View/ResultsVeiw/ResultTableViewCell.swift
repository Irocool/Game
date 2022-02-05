//
//  ResultTableViewCell.swift
//  Game
//
//  Created by Irina Kulugina on 02.02.2022.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var usedHintsLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    func configure(with gameResult: GameResult) {
        backgroundColor = UIColor.blue

        let date = globalDateFormatter.string(from: gameResult.date)
        
        dateLabel.text = "Дата: \(date)"
        correctAnswersLabel.text = "Количество правильных ответов: \(gameResult.correctAnswersCount)"
        scoreLabel.text = "Заработано денег: \(gameResult.score)"
        usedHintsLabel.text = "Подсказок использовано: \(gameResult.usedHintsCount)"
        
        [dateLabel, correctAnswersLabel, scoreLabel, usedHintsLabel].forEach { (label) in
    
            label?.sizeToFit()
        }
    }
}

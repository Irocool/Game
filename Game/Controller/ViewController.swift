//
//  ViewController.swift
//  Game
//
//  Created by Irina Kuligina on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameGame: UILabel!
    
    @IBAction func ButtonPlay(_ sender: UIButton) {
    }
    
    @IBAction func ButtonSettings(_ sender: UIButton) {
    }
    
    @IBAction func ButtonClear(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Action-ы кнопок

    @IBAction func battonPlayTapped(_ sender: UIButton!) {
    
        let questions = QuestionsStorage.shared.getData
        let gameSession = GameSession(questionsCount: questions.count)
        Game.shared.session = gameSession
        
        let gameVC = GameViewContoller(questions: questions , gameSesson: gameSession)
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func ButtonSettingsTapped(_ sender: UIButton) {
        let resultsVC = ResultsTableViewController()
        
        self.present(resultsVC, animated: true, completion: nil)
    }
    
    @IBAction func ButtonClearTapped(_ sender: UIButton) {
        Game.shared.clearResults()
        showAlert(title: "Результаты", message: "Статистика очищена.")
    }
    
}


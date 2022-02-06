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
    
   // @IBAction func ButtonClear(_ sender: UIButton) {
   // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.background
    }

    
    // MARK: - Action-ы кнопок

    @IBAction func battonPlayTapped(_ sender: UIButton!) {
    
        let questions = QuestionsInOrderFacade().get()
        let gameSession = GameSession(questionsCount: questions.count)
        Game.shared.session = gameSession
        
        let gameVC = GameViewContoller(questions: questions , gameSesson: gameSession)
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func ButtonSettingsTapped(_ sender: UIButton) {
        let settingsVC = SettingsViewController()
        
        self.present(settingsVC, animated: true, completion: nil)
        
    }
    
    @IBAction func ButtonResultTapped(_ sender: UIButton) {
        let resultsVC = ResultsTableViewController()
        
        self.present(resultsVC, animated: true, completion: nil)
        
    }
    
    
}


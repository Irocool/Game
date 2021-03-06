//
//  SettingsViewController.swift
//  Game
//
//  Created by Irina Kuligina on 06.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    var questionsModeSegmentedControl = UISegmentedControl()
    var questionsButton = UIButton()
    var clearResultsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.background
        setupElements()
    }
    
    // MARK: - Настройка UI элементов
    
    private func setupElements() {
        let window = UIApplication.shared.windows[0]
        let safeAreaOffset = window.safeAreaInsets.top
        let topOffset = 55
        let buttonHeight = 50
        setupQuestionsModeSegmentedControl(Int(safeAreaOffset))
        setupQuestionsButton(topOffset, buttonHeight)
        setupClearResultsButton(topOffset, buttonHeight)
        setupButtonsStyle(buttonHeight)
    }
    
    private func setupQuestionsModeSegmentedControl(_ topOffset: Int) {
        view.addSubview(questionsModeSegmentedControl)
        
        let sideOffset = 15
        let width = Int(view.bounds.width) - sideOffset*2
        let height = 50
        let frame = CGRect(
            x: sideOffset,
            y: topOffset,
            width: width,
            height: height
        )
        questionsModeSegmentedControl.frame = frame
        questionsModeSegmentedControl.backgroundColor = Color.elementBackground
        questionsModeSegmentedControl.selectedSegmentTintColor = Color.scoreBackground
        questionsModeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.textAlternative], for: .selected)
        questionsModeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.text], for: .normal)
        questionsModeSegmentedControl.insertSegment(withTitle: "Последовательно", at: 0, animated: false)
        questionsModeSegmentedControl.insertSegment(withTitle: "Случайно", at: 1, animated: false)
        questionsModeSegmentedControl.selectedSegmentIndex = Game.shared.questionsMode.rawValue
        questionsModeSegmentedControl.addTarget(self, action: #selector(questionModeSegmentedContolValueChanged), for: .valueChanged)
    }
    
    private func setupQuestionsButton(_ topOffset: Int, _ height: Int) {
        view.addSubview(questionsButton)
        
        let questionsModeSegmentedControlFrame = questionsModeSegmentedControl.frame
        let width = 150
        let xCenter = Int(view.center.x) - (width/2)
        let frame = CGRect(
            x: xCenter,
            y: Int(questionsModeSegmentedControlFrame.maxY) + topOffset,
            width: width,
            height: height
        )
        questionsButton.frame = frame
        questionsButton.setTitle("Вопросы", for: .normal)
        questionsButton.addTarget(self, action: #selector(questionsButtonTapped), for: .touchUpInside)
    }
    
    private func setupClearResultsButton(_ topOffset: Int, _ height: Int) {
        view.addSubview(clearResultsButton)
        
        let questionsButtonFrame = questionsButton.frame
        let width = 250
        let xCenter = Int(view.center.x) - (width/2)
        let frame = CGRect(
            x: xCenter,
            y: Int(questionsButtonFrame.maxY) + topOffset,
            width: width,
            height: height
        )
        clearResultsButton.frame = frame
        clearResultsButton.setTitle("Очистить статистику", for: .normal)
        clearResultsButton.addTarget(self, action: #selector(clearResultsButtonTapped), for: .touchUpInside)
    }
    
    private func setupButtonsStyle(_ buttonHeight: Int) {
        [questionsButton, clearResultsButton].forEach { (button) in
            button.setTitleColor(Color.text, for: .normal)
            button.backgroundColor = Color.elementBackground
            button.layer.cornerRadius = CGFloat(buttonHeight/2)
            button.layer.borderWidth = 1
            button.layer.borderColor = Color.text.cgColor
        }
    }
    
    // MARK: - (Action): Изменение порядка вопросов
    
    @objc func questionModeSegmentedContolValueChanged(sender: UISegmentedControl!) {
        switch sender.selectedSegmentIndex {
        case 0:
            // Serial
            Game.shared.questionsMode = .serial
        case 1:
            // Random
            Game.shared.questionsMode = .random
        default:
            break
        }
    }
    
    // MARK: - (Action): Переход к таблице вопросов
    
    @objc func questionsButtonTapped(sender: UIButton!) {
        let questionsVC = QuestionsTableViewController()

        self.present(questionsVC, animated: true, completion: nil)
    }
    
    // MARK: - (Action): Очистка результатов
    
    @objc func clearResultsButtonTapped(sender: UIButton!) {
        Game.shared.clearResults()
        showAlert(title: "Результаты", message: "Статистика очищена.")
    }
}


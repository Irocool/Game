//
//  QuestionsTableViewController.swift
//  Game
//
//  Created by Irina Kuligina on 06.02.2022.
//

import UIKit

protocol QuestionsTableDelegate: AnyObject {
    func addToTable(question: Question)
}

class QuestionsTableViewController: UIViewController {
    var addButton = UIButton()
    var tableView = UITableView()
    
    var questions = QuestionsStorage.shared.get()
    
    private var testCell = QuestionTableViewCell()
    private let bottomPadding = UIApplication.shared.windows[0].safeAreaInsets.bottom
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.elementBackground
        
        setupTableView()
        setupAddButton()
    }
}

// MARK: - Настройка TableView

extension QuestionsTableViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        view.addSubview(tableView)
        
        let frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height - bottomPadding
        )
        tableView.frame = frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Color.elementBackground
        tableView.allowsSelection = false
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.reuseCellIdentifier)
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 105, right: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.reuseCellIdentifier, for: indexPath) as! QuestionTableViewCell
        
        let question = questions[indexPath.row]
        
        cell.configure(with: question)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        testCell = QuestionTableViewCell()
        let question = QuestionsStorage.shared.get()[indexPath.row]
        testCell.configure(with: question)
        
        let height = testCell.height + 15
        
        return height
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            QuestionsStorage.shared.remove(at: indexPath.row)
            questions.remove(at: indexPath.row)
            if questions.isEmpty {
                tableView.reloadData()
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}

// MARK: - Настройка кнопки добавить вопрос

extension QuestionsTableViewController {
    private func setupAddButton() {
        view.addSubview(addButton)
        
        let width: Int = 50
        let height = width
        let xOrigin = (Int(UIScreen.main.bounds.width) - width)/2
        let yOrigin = Int(UIScreen.main.bounds.height - bottomPadding) - 2*height
        
        let frame = CGRect(
            x: xOrigin,
            y: yOrigin,
            width: width,
            height: height
        )
        addButton.frame = frame
        addButton.backgroundColor = Color.elementBackground
        addButton.tintColor = Color.scoreBackground
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.layer.cornerRadius = CGFloat(height/2)
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = Color.textAlternative.cgColor
        addButton.layer.shadowColor = Color.text.cgColor
        addButton.layer.shadowOffset = .zero
        addButton.layer.shadowOpacity = 0.8
        addButton.layer.shadowRadius = 5.0
        addButton.layer.masksToBounds = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped(sender: UIButton!) {
        let addQuestionVC = AddNewQuestionViewController()
        addQuestionVC.delegate = self
        
        self.present(addQuestionVC, animated: true, completion: nil)
    }
}

// MARK: - (Delegate): Добавление нового вопроса

extension QuestionsTableViewController: QuestionsTableDelegate {
    func addToTable(question: Question) {
        questions.append(question)
        tableView.reloadData()
    }
}


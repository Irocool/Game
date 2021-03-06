//
//  ResultsTableViewController.swift
//  Game
//
//  Created by Irina Kuligina on 02.02.2022.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    private let reuseCellIdentifier = "ResultTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.backgroundColor = Colors.elementBackground
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: reuseCellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
          
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier, for: indexPath) as! ResultTableViewCell
        
        let index = Game.shared.results.count - indexPath.row - 1
        let result = Game.shared.results[index]
        
        cell.configure(with: result)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

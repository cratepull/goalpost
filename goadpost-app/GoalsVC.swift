//
//  GoalsVC.swift
//  goadpost-app
//
//  Created by Sebastian Salamanca on 2/7/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isHidden = false
        
    }
    
    
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVC  = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC")
            else {return}
        presentDetail(createGoalVC)
    }
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as?  GoalCell
            else {
                return UITableViewCell()
        }
        
        cell.configureCell(description: "Code every day", type: .longTerm, goalProgressAmount: 3)
        
        return cell
        
    }

}

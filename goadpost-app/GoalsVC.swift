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
    
    var goalsArray: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.fetch { (complete) in
            if complete{
                if goalsArray.count > 0{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
        
        tableView.reloadData()
        
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
        return goalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as?  GoalCell
            else {
                return UITableViewCell()
        }
        
        let goal = goalsArray[indexPath.row]
        
        cell.configureCell(goal: goal )
        
        return cell
        
    }

}




extension GoalsVC{

    func fetch(completion: (_ complete: Bool)->()){
    
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do{
            goalsArray = try  managedContext.fetch(fetchRequest)
            print("successfully fetched data.")
            completion(true)
        }catch{
            debugPrint("Could not fetch\(error)")
            completion(true)
            
        }
    }
}




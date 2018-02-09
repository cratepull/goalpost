//
//  GoalCell.swift
//  goadpost-app
//
//  Created by Sebastian Salamanca on 2/7/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    func configureCell(goal: Goal){
        
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress )
    
    }
}

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
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int){
        
        self.goalDescriptionLbl.text = description
        self.goalType.text = type.rawValue
        self.goalProgress.text = String(describing: goalProgressAmount)
    
    }
}

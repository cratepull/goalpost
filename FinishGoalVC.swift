//
//  FinishGoalVC.swift
//  goadpost-app
//
//  Created by Sebastian Salamanca on 2/8/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription:String!
    var goalType: GoalType!
    
    func initData(description:String, type:GoalType){
        self.goalDescription = description
        self.goalType = type
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn.bindToKeyboard()
        pointsTextField.delegate = self
        
    }
    
    @IBAction func createBtnWasPressed(_ sender: Any) {
    }
}

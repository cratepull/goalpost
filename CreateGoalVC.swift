//
//  CreateGoalVC.swift
//  goadpost-app
//
//  Created by Sebastian Salamanca on 2/7/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTemBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTemBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
        
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTemBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTemBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
}

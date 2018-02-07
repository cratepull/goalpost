//
//  UIViewControolerExt.swift
//  goadpost-app
//
//  Created by Sebastian Salamanca on 2/7/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController){
        let transition = CATransition()
        
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    
    }
    
    func dismissDetail(){
        
        let transition = CATransition()
        
        transition.duration = 0.3
        transition.type = kCATransitionFromLeft
        transition.subtype = kCATransitionFromRight
        
        dismiss(animated: false, completion: nil)
        
    }
}

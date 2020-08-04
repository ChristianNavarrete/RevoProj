//
//  ViewController.swift
//  Revo_Project
//
//  Created by John on 7/31/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var buttons = [UIButton()]
    
    var snap:UISnapBehavior!
    var animator:UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [self.button1,self.button2,self.button3]
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        
        for button in buttons {
            let pos = button.center
            
            button.center = CGPoint(x: self.view.frame.width / 2, y: -button.frame.height)
            
            snap = UISnapBehavior(item: button, snapTo: pos)
            animator.addBehavior(snap)
        }
        
    }


}


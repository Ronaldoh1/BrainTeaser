//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/16/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {

    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonConstraint: NSLayoutConstraint!
    
    var animationEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationEngine = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginButtonConstraint])
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animationEngine.animateOnScreen(1)
    }
  
}


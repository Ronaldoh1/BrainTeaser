//
//  GameVC.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/20/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {

    @IBOutlet weak var yesButton: CustomButton!
    
    @IBOutlet weak var noButton: CustomButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var currentCard: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(currentCard)
    }
 
    @IBAction func yesButtonTapped(sender: CustomButton) {
        
        if sender.titleLabel!.text == "YES" {
            checkAnswer()
            showNextCard()
        } else {
            titleLabel.text = "Does this card match the previous"
        }
    }
    
    @IBAction func noButtonTapped(sender: CustomButton) {
        checkAnswer()
        showNextCard()
    }
    
    func showNextCard() {
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPoint, completion: { (animation, finished) in
                cardToRemove.removeFromSuperview()
            })
            
            if let next = createCardFromNib() {
                next.center = AnimationEngine.offScreenRightPosition
                self.view.addSubview(next)
                currentCard = next
                
                if noButton.hidden {
                    noButton.hidden = false
                    yesButton.setTitle("YES", forState: .Normal)
                }
                
                AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (animation, finished) in
                    
                })
            }
        }
        
    }
    
    func createCardFromNib() -> CardView! {
        
      return NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as! CardView
    }
    
    func checkAnswer() {
        
    }
}

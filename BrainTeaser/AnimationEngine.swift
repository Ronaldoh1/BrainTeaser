//
//  AnimationEngine.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/19/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import pop
import UIKit

class AnimationEngine {
    
    class var offScreenRightPosition: CGPoint {
        return CGPointMake(UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    class var offScreenLeftPoint: CGPoint {
        return CGPointMake(-UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    class var screenCenterPosition: CGPoint {
        return CGPointMake(CGRectGetMidX(UIScreen.mainScreen().bounds), CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    var originalConstants = [CGFloat]()
    var constraints = [NSLayoutConstraint]()
    
    init(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            originalConstants.append(constraint.constant)
            constraint.constant = AnimationEngine.offScreenRightPosition.x
        }
        
        self.constraints = constraints
    }
    
    func animateOnScreen(delay: Int) {
        
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(delay) * Double(NSEC_PER_SEC)))
        
        dispatch_after(time, dispatch_get_main_queue()) {
           
            var index = 0
            repeat {
                let moveAnimation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
                moveAnimation.toValue = self.originalConstants[index]
                moveAnimation.springBounciness = 12
                moveAnimation.springSpeed = 12
                
                if index > 0 {
                    moveAnimation.dynamicsFriction += 20 + CGFloat(index)
                }
                
                let constraint = self.constraints[index]
                constraint.pop_addAnimation(moveAnimation, forKey: "moveOnScreen")
                index += 1
                
            } while (index < self.constraints.count)
        }
    }
    
    class func animateToPosition(view: UIView, position: CGPoint, completion: ((POPAnimation!, Bool) -> Void)) {
        let moveAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPosition)
        moveAnimation.toValue = NSValue(CGPoint: position)
        moveAnimation.springBounciness = 8
        moveAnimation.springSpeed = 8
        moveAnimation.pop_addAnimation(moveAnimation, forKey: "moveToPosition")
    }
    
}
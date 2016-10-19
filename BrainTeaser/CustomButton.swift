//
//  CustomButton.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/16/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit
import pop

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.whiteColor() {
        didSet{
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.addTarget(self, action: #selector(scaleToSmall), forControlEvents: .TouchDown)
        self.addTarget(self, action: #selector(scaleToSmall),forControlEvents: .TouchDragExit)
        self.addTarget(self, action:  #selector(scaleAnimation), forControlEvents: .TouchUpInside)
        self.addTarget(self, action: #selector(scaleDefault), forControlEvents: .TouchDragExit)
    }
    
    func scaleToSmall() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.95, 0.95))
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleAnimation() {
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        scaleAnimation.toValue = NSValue (CGSize: CGSizeMake(1.0, 1.0))
        scaleAnimation.springBounciness = 18
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleAnimation")
    }
    
    func scaleDefault() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleDefaultAnimation")
    }

}

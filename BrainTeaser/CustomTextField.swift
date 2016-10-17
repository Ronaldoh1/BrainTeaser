//
//  CustomTextField.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/16/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    @IBInspectable var inset: CGFloat = 8
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet{
          setupView()
        }
    }
    //set the rectangle when the text is not being edited
    override func textRectForBounds(bounds: CGRect) -> CGRect {
      return CGRectInset(bounds, inset, inset)
    }
    
    //set rec when the textfield is being edited
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}

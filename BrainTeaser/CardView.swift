//
//  CardView.swift
//  BrainTeaser
//
//  Created by Ronald Hernandez on 10/21/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class CardView: UIView {

    let shapes = ["figure1", "figure2", "figure3"]
    
    var currentShape:String!

    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.setNeedsLayout()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        selectShape()
    }
    
    func selectShape() {
        currentShape = shapes[Int(arc4random_uniform(3))]
        shapeImage.image = UIImage(named: currentShape)
    }
    
}

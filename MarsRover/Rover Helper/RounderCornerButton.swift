//
//  RounderCornerButton.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 17/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

class RounderCornerButton: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        backgroundColor = .clear
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
    }

}

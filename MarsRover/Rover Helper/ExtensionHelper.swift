//
//  ExtensionHelper.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 15/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

extension UIButton {
    func setBorder() {
        backgroundColor = .clear
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
    }
}

extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        view.addGestureRecognizer(endEditingRecognizer())
        navigationController?.navigationBar.addGestureRecognizer(endEditingRecognizer())
    }
    
    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: view, action: #selector(view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

extension Rover {
    func convertRoverPositionToString() -> String {
        let facing: String
        switch self.currentPosition().direction {
        case .north:
            facing = "N"
        case .east:
            facing = "E"
        case .west:
            facing = "W"
        case .south:
            facing = "S"
        }
        
        return String(format: "%@ %@ %@", arguments: [self.currentPosition().xValue.description,
                                                                     self.currentPosition().yValue.description,
                                                                     facing])
    }
}

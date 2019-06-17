//
//  ExtensionHelper.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 15/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

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
    
    /// Converts Rover position into a String format.
    /// @returns String
    func convertRoverPositionToString() -> String {
        let facing: String
        
        switch currentPosition().direction {
        case .north:
            facing = "N"
        case .east:
            facing = "E"
        case .west:
            facing = "W"
        case .south:
            facing = "S"
        }
        
        return String(format: "%@ %@ %@", arguments: [currentPosition().xValue.description,
                                                                     currentPosition().yValue.description,
                                                                     facing])
    }
}

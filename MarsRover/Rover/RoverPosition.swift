//
//  RoverPosition.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 16/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import Foundation

struct RoverPosition {
    
    /// xValue is a X unit of coordinate (X, Y).
    let xValue: Int64
    
    /// yValue is a Y unit of coordinate (X, Y).
    let yValue: Int64
    
    /// direction is a direction of Rover for example (North, South, East, West).
    let direction: Direction
    
    init(xValue: Int64, yValue: Int64, direction: Direction) {
        self.xValue = xValue
        self.yValue = yValue
        self.direction = direction
    }
}

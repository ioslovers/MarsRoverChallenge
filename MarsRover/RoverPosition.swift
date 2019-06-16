//
//  RoverPosition.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 16/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import Foundation

struct RoverPosition {
    let xValue: Int64
    let yValue: Int64
    let direction: Direction
    
    init(xValue: Int64, yValue: Int64, direction: Direction) {
        self.xValue = xValue
        self.yValue = yValue
        self.direction = direction
    }
}

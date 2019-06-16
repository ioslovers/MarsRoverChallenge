//
//  Rover.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 16/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

public enum Direction: Int {
    case north = 1,
    east,
    south,
    west
}

final class Rover {
    
    // MARK:- Private Variables
    private var xPoint: Int64 = 0
    private var yPoint: Int64 = 0
    private lazy var facing: Direction = {
        return .north
    }()
    
    // MARK:- Public Functions
    public func setPosition(xPoint:Int64, yPoint:Int64, facing:Direction){
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.facing = facing
    }
    
    @discardableResult public func currentPosition() -> RoverPosition {
        switch facing {
        case .north:
            return RoverPosition(xValue: xPoint, yValue: yPoint, direction: .north)
        case .east:
            return RoverPosition(xValue: xPoint, yValue: yPoint, direction: .east)
        case .south:
            return RoverPosition(xValue: xPoint, yValue: yPoint, direction: .south)
        case .west:
            return RoverPosition(xValue: xPoint, yValue: yPoint, direction: .west)
        }
    }
    
    public func processRoverCommand(command:String) {
        _ = command.map { processCommand(char: $0) }
    }
    
    // MARK:- Private Functions
    private func processCommand(char: Character) {
        switch char {
        case "L": turnLeftCommand()
        case "R": turnRightCommand()
        case "M": moveCommand()
        default:  print(Constants.RoverInputs.errorInCommand)
        }
    }
    
    private func turnLeftCommand(){
        if (facing.rawValue - 1) < Direction.north.rawValue {
            facing = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: facing.rawValue - 1) else { return }
            facing = rawValueFacing
        }
    }
    
    private func turnRightCommand(){
        if (facing.rawValue + 1) > Direction.west.rawValue {
            facing = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: facing.rawValue + 1) else { return }
            facing = rawValueFacing
        }
    }
    
    private func moveCommand() {
        if (facing == .north && yPoint != 5 && yPoint >= 0) {
            yPoint = yPoint + 1
        } else if (facing == .east && xPoint != 5 && xPoint >= 0) {
            xPoint = xPoint + 1
        } else if (facing == .south && yPoint != 0 && yPoint >= 0) {
            yPoint = yPoint - 1
        } else if (facing == .west && xPoint != 0 && xPoint >= 0) {
            xPoint = xPoint - 1
        } else {
            print(Constants.RoverInputs.errorInRange)
        }
    }
}

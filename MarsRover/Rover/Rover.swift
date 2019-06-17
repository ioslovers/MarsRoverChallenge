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
    private lazy var direction: Direction = {
        return .north
    }()
    
    // MARK:- Public Functions
    
    /// setPosition is to set X, Y and direction of the Rover.
    /// @param xPoint, yPoint, direction.
    public func setPosition(xPoint:Int64, yPoint:Int64, direction:Direction){
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.direction = direction
    }
    
    /// currentPosition will return currentPosition of the Rover.
    /// returns RoverPosition which is struct.
    @discardableResult public func currentPosition() -> RoverPosition {
        switch direction {
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
    
    /// processRoverCommand will return currentPosition of the Rover.
    /// @param command which is an string for example "LMLMLMLMM"
    public func processRoverCommand(command:String) {
        _ = command.map { processCommand(char: $0) }
    }
    
    // MARK:- Private Functions
    
    /// processCommand will take each character(L, R, M) and performs Left, Right, Move.
    /// @param char which is an character for example "L"
    private func processCommand(char: Character) {
        switch char {
        case "L": turnLeftCommand()
        case "R": turnRightCommand()
        case "M": moveCommand()
        default:  print(Constants.RoverInputs.errorInCommand)
        }
    }
    
    /// turnLeftCommand command will allow rover to left from it's current position.
    private func turnLeftCommand(){
        if (direction.rawValue - 1) < Direction.north.rawValue {
            direction = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue - 1) else { return }
            direction = rawValueFacing
        }
    }
    
    /// turnRightCommand command will allow rover to right from it's current position.
    private func turnRightCommand(){
        if (direction.rawValue + 1) > Direction.west.rawValue {
            direction = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue + 1) else { return }
            direction = rawValueFacing
        }
    }
    
    /// moveCommand will allow rover to move by 1 unit.
    private func moveCommand() {
        if (direction == .north && yPoint != 5 && yPoint >= 0) {
            yPoint = yPoint + 1
        } else if (direction == .east && xPoint != 5 && xPoint >= 0) {
            xPoint = xPoint + 1
        } else if (direction == .south && yPoint != 0 && yPoint >= 0) {
            yPoint = yPoint - 1
        } else if (direction == .west && xPoint != 0 && xPoint >= 0) {
            xPoint = xPoint - 1
        } else {
            print(Constants.RoverInputs.errorInRange)
        }
    }
}

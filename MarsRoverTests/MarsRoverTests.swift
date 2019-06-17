//
//  MarsRoverTests.swift
//  MarsRoverTests
//
//  Created by Ashish Tripathi on 14/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import XCTest
@testable import MarsRover

class MarsRoverTests: XCTestCase {

    let rover = Rover()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRoverFacingNorth() {
        let expectedOutput = "1 3 N"
        let rover = Rover()
        rover.setPosition(xPoint: 1,
                          yPoint: 2,
                          direction: .north)
        
        rover.processRoverCommand(command: "LMLMLMLMM")
        XCTAssertEqual(expectedOutput, rover.convertRoverPositionToString())
        
    }
    
    func testRoverFacingEast() {
        let expectedOutput = "5 1 E"
        rover.setPosition(xPoint: 3,
                          yPoint: 3,
                          direction: .east)
        
        rover.processRoverCommand(command: "MMRMMRMRRM")
        let roverCurrentPosition = rover.currentPosition()
        print(roverCurrentPosition)
        XCTAssertEqual(expectedOutput, rover.convertRoverPositionToString())
        
    }
    
    func testRoverFacingWest() {
        let expectedOutput = "4 4 W"
        rover.setPosition(xPoint: 4,
                          yPoint: 4,
                          direction: .west)
        
        rover.processRoverCommand(command: "LMLMLMLM")
        let roverCurrentPosition = rover.currentPosition()
        print(roverCurrentPosition)
        XCTAssertEqual(expectedOutput, rover.convertRoverPositionToString())
        
    }
    
    func testRoverFacingSouth() {
        let expectedOutput = "4 2 S"
        rover.setPosition(xPoint: 4,
                          yPoint: 4,
                          direction: .west)
        
        rover.processRoverCommand(command: "LMLMLMLMLMM")
        let roverCurrentPosition = rover.currentPosition()
        print(roverCurrentPosition)
        XCTAssertEqual(expectedOutput, rover.convertRoverPositionToString())
        
    }
}

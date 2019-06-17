//
//  MarsRoverUITests.swift
//  MarsRoverUITests
//
//  Created by Ashish Tripathi on 16/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import XCTest

class MarsRoverUITests: XCTestCase {

    var marsRoverApp = XCUIApplication()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        marsRoverApp.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRoverPositionNorth() {
        let textFieldX = marsRoverApp.textFields["textFieldXIdentifier"]
        let textFieldY = marsRoverApp.textFields["textFieldYIdentifier"]
        let buttonleftButton = marsRoverApp.buttons["buttonLeftIdentifier"]
       
        let buttonMoveButton = marsRoverApp.buttons["buttonMoveIdentifier"]
        let buttonDoneButton = marsRoverApp.buttons["buttonDoneIdentifier"]
        
        textFieldX.typeText("1")
        textFieldY.tap()
        textFieldY.typeText("2")
        
        buttonleftButton.tap()
        buttonMoveButton.tap()
        buttonleftButton.tap()
        buttonMoveButton.tap()
        buttonleftButton.tap()
        buttonMoveButton.tap()
        buttonleftButton.tap()
        buttonMoveButton.tap()
        buttonMoveButton.tap()

        buttonDoneButton.tap()
        let alert = marsRoverApp.alerts["Current Rover Location"]
        XCTAssert(marsRoverApp.alerts.element.staticTexts["1 3 N"].exists)
        alert.buttons["Ok"].tap()
    }
    
    func testRoverPositionEast() {
        let textFieldX = marsRoverApp.textFields["textFieldXIdentifier"]
        let textFieldY = marsRoverApp.textFields["textFieldYIdentifier"]
        let buttonRightButton = marsRoverApp.buttons["buttonRightIdentifier"]
        let buttonEast = marsRoverApp.buttons["East"]
        let buttonMoveButton = marsRoverApp.buttons["buttonMoveIdentifier"]
        let buttonDoneButton = marsRoverApp.buttons["buttonDoneIdentifier"]


        textFieldX.typeText("3")
        textFieldY.tap()
        textFieldY.typeText("3")
        buttonEast.tap()

        buttonMoveButton.tap()
        buttonMoveButton.tap()
        buttonRightButton.tap()
        buttonMoveButton.tap()
        buttonMoveButton.tap()
        buttonRightButton.tap()
        buttonMoveButton.tap()
        buttonRightButton.tap()
        buttonRightButton.tap()
        buttonMoveButton.tap()

        buttonDoneButton.tap()
        let alert = marsRoverApp.alerts["Current Rover Location"]
        XCTAssert(marsRoverApp.alerts.element.staticTexts["5 1 E"].exists)
        alert.buttons["Ok"].tap()
    }

}

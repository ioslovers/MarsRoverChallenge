//
//  MarsRoverViewController.swift
//  MarsRover
//
//  Created by Ashish Tripathi on 14/6/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

class MarsRoverViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private var textFieldXValue: UITextField!
    @IBOutlet private var textFieldYValue: UITextField!
    @IBOutlet private var segmentControlDirection: UISegmentedControl!
    @IBOutlet private var textFieldCommand: UITextField!
    @IBOutlet private var buttonLeft: UIButton!
    @IBOutlet private var buttonRight: UIButton!
    @IBOutlet private var buttonMove: UIButton!
    @IBOutlet private var buttonDone: UIButton!
    @IBOutlet private var buttonReset: UIButton!
    
    // MARK:- Private Variables
    private lazy var rover = Rover()
    private var commandText = ""
    
    // MARK:- View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    /// Setup view and basic routine.
    private func setupView() {
        textFieldXValue.becomeFirstResponder()
        textFieldXValue.delegate = self
        textFieldYValue.delegate = self
        setupHideKeyboardOnTap()
    }
    
    // MARK:- Private Functions
    
    /// Reset rover's input fields such as X, Y, Direction and Command.
    private func resetRover() {
        textFieldCommand.text = ""
        commandText = ""
        segmentControlDirection.selectedSegmentIndex = 0
        textFieldXValue.text = ""
        textFieldYValue.text = ""
    }
    
    /// shows alert to get the Rover location.
    private func showAlert(title: String, message: String) {
        let alert = Alert.init(title: title,
                               subTitle: message,
                               buttonTitles: [],
                               cancelTitle: NSLocalizedString("localizableOkButton", comment: ""))
        alert.presentAlert(from: self, actionHandler: { (_, _) in }) {  [weak self] _ in
            guard let weakSelf = self else { return }
            weakSelf.resetRover()
        }
    }
    
    // MARK:- Button actions
    
    /// Done button action which shows Rover's current location for example (1 3 N)
    @IBAction func doneButtonAction(_ sender: Any) {
        
        guard let xValue = textFieldXValue.text,
            let yValue = textFieldYValue.text,
            let rawValueDirection = Direction(rawValue: segmentControlDirection.selectedSegmentIndex + 1),
            let command = textFieldCommand?.text else { return }
        
        rover.setPosition(xPoint: Int64(xValue) ?? 0,
                          yPoint: Int64(yValue) ?? 0,
                          direction: rawValueDirection)
        
        rover.processRoverCommand(command: command)
        showAlert(title: NSLocalizedString("localizableAlertTitle", comment: ""),
                  message: rover.convertRoverPositionToString())
    }
    
    /// Left button action which performed move command for the Rover.
    @IBAction func leftButtonAction(_ sender: Any) {
        commandText.append("L")
        textFieldCommand.text = commandText
    }
    
    /// Right button action which performed move command for the Rover.
    @IBAction func rightButtonAction(_ sender: Any) {
        commandText.append("R")
        textFieldCommand.text = commandText
    }
    
    /// Move button action which performed move command for the Rover.
    @IBAction func moveButtonAction(_ sender: Any) {
        commandText.append("M")
        textFieldCommand.text = commandText
    }
    
    /// Reset button action which clears rover's input fields such as X, Y, Direction and Command.
    @IBAction func resetButtonAction(_ sender: Any?) {
        resetRover()
    }
}

extension MarsRoverViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let allowedCharSet = NSCharacterSet(charactersIn:Constants.RoverInputs.allowedRegx).inverted
        let compSepByCharInSet = string.components(separatedBy: allowedCharSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        if string == numberFiltered {
         textField.text = ""
        }
        return string == numberFiltered
    }
}


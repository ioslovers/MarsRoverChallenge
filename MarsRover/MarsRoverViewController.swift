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
    
    private func setupView() {
        textFieldXValue.becomeFirstResponder()
        textFieldXValue.delegate = self
        textFieldYValue.delegate = self
        
        buttonLeft.setBorder()
        buttonRight.setBorder()
        buttonMove.setBorder()
        buttonDone.setBorder()
        buttonReset.setBorder()
        
        setupHideKeyboardOnTap()
    }
    
    // MARK:- Private Functions
    private func resetRover() {
        textFieldCommand.text = ""
        commandText = ""
        segmentControlDirection.selectedSegmentIndex = 0
        textFieldXValue.text = ""
        textFieldYValue.text = ""
    }
    
    // MARK:- Button actions
    @IBAction func doneButtonAction(_ sender: Any) {
        
        guard let xValue = textFieldXValue.text,
            let yValue = textFieldYValue.text,
            let rawValueDirection = Direction(rawValue: segmentControlDirection.selectedSegmentIndex + 1),
            let command = textFieldCommand?.text else { return }
        
        rover.setPosition(xPoint: Int(xValue) ?? 0,
                          yPoint: Int(yValue) ?? 0,
                          facing: rawValueDirection)
        
        rover.processRoverCommand(command: command)
        let printMessage = rover.currentPosition()
        
        let alertController = UIAlertController(title: "Current Rover Location",
                                                message: printMessage,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default) { [weak self]_ in
            guard let weakSelf = self else { return }
            weakSelf.resetRover()
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func leftButtonAction(_ sender: Any) {
        commandText.append("L")
        textFieldCommand.text = commandText
    }
    
    @IBAction func rightButtonAction(_ sender: Any) {
        commandText.append("R")
        textFieldCommand.text = commandText
    }
    
    @IBAction func moveButtonAction(_ sender: Any) {
        commandText.append("M")
        textFieldCommand.text = commandText
    }
    
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


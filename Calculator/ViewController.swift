//
//  ViewController.swift
//  Calculator
//
//  Created by Melissa  Garrett on 9/21/16.
//  Copyright © 2016 bitfountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var displayValue: String?
    var operand: Double?
    var operation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Operation IBActions
    
    @IBAction func multiplyTapped(_ sender: UIButton) {
        var doubleValueFromDisplayValue: Double?
        
        // if displayValue != nil, then convert currentValue to a Double and set it
        if let currentValue = displayValue, let doubleFromCurrentValue = Double(currentValue) {
            doubleValueFromDisplayValue = doubleFromCurrentValue
        }
        
        // the value entered by user is invalid (couldn't be converted to a Double)
        if doubleValueFromDisplayValue == nil {
            displayValue = nil
            displayLabel.text = "0"
        }
        else if operand == nil { //user only entered 1st part and multiplication sign
            operand = doubleValueFromDisplayValue
            operation = "*"
            displayValue = nil
        }
        else if operand != nil { // user has entered 2nd part
            if operation == "+" {
                operand = operand! + doubleValueFromDisplayValue!
            }
            else if operation == "-" {
                operand = operand! - doubleValueFromDisplayValue!
            }
            else if operation == "*" {
                operand = operand! * doubleValueFromDisplayValue!
            }
            else if operation == "/" {
                operand = operand! / doubleValueFromDisplayValue!
            }
            
            operation = "*"
            displayValue = nil
            displayLabel.text = "\(operand!)"
        }
    }
    
    @IBAction func divideTapped(_ sender: UIButton) {
        var doubleValueFromDisplayValue: Double?
        
        // if displayValue != nil, then convert currentValue to a Double and set it
        if let currentValue = displayValue, let doubleFromCurrentValue = Double(currentValue) {
            doubleValueFromDisplayValue = doubleFromCurrentValue
        }
        
        // the value entered by user is invalid (couldn't be converted to a Double)
        if doubleValueFromDisplayValue == nil {
            displayValue = nil
            displayLabel.text = "0"
        }
        else if operand == nil { //user only entered 1st part and multiplication sign so far
            operand = doubleValueFromDisplayValue // save the 1st part entered into 'operand'
            operation = "/" // save the operator entered
            displayValue = nil // clear out to receive 2nd part
        }
        else if operand != nil { // user has entered 2nd part
            if operation == "+" {
                operand = operand! + doubleValueFromDisplayValue! // and 1st part and new 2nd part
            }
            else if operation == "-" {
                operand = operand! - doubleValueFromDisplayValue!
            }
            else if operation == "*" {
                operand = operand! * doubleValueFromDisplayValue!
            }
            else if operation == "/" {
                operand = operand! / doubleValueFromDisplayValue!
            }
            
            operation = "/"
            displayValue = nil
            displayLabel.text = "\(operand!)"
        }

    }
    
    @IBAction func subtractTapped(_ sender: UIButton) {
        var doubleValueFromDisplayValue: Double?
        
        if let currentValue = displayValue, let doubleValueFromCurrentValue = Double(currentValue) {
            doubleValueFromDisplayValue = doubleValueFromCurrentValue
        }
        
        if doubleValueFromDisplayValue == nil {
            displayValue = nil
            displayLabel.text = "0"
        }
        else if operand == nil {
            operand = doubleValueFromDisplayValue
            operation = "-"
            displayValue = nil
        }
        else if operand != nil {
            if operation == "+" {
                operand = operand! + doubleValueFromDisplayValue!
            }
            else if operation == "-" {
                operand = operand! - doubleValueFromDisplayValue!
            }
            else if operation == "*" {
                operand = operand! * doubleValueFromDisplayValue!
            }
            else if operation == "/" {
                operand = operand! / doubleValueFromDisplayValue!
            }
            
            operation = "-"
            displayValue = nil
            displayLabel.text = "\(operand!)"
        }
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        var doubleValueFromDisplayValue: Double?
        
        if let currentValue = displayValue, let doubleValueFromCurrentValue = Double(currentValue) {
            doubleValueFromDisplayValue = doubleValueFromCurrentValue
        }
        
        if doubleValueFromDisplayValue == nil {
            displayValue = nil
            displayLabel.text = "0"
        }
        else if operand == nil {
            operand = doubleValueFromDisplayValue
            operation = "+"
            displayValue = nil
        }
        else if operand != nil {
            if operation == "+" {
                operand = operand! + doubleValueFromDisplayValue!
            }
            else if operation == "-" {
                operand = operand! - doubleValueFromDisplayValue!
            }
            else if operation == "*" {
                operand = operand! * doubleValueFromDisplayValue!
            }
            else if operation == "/" {
                operand = operand! / doubleValueFromDisplayValue!
            }
            
            operation = "+"
            displayValue = nil
            displayLabel.text = "\(operand!)"
        }
    }
    
    @IBAction func equalsTapped(_ sender: UIButton) {
        if let currentValue = displayValue, let doubleFromCurrentValue = Double(currentValue) {
            if operation == "+" { // operation and operand were previously set before the = was tapped
                operand = operand! + doubleFromCurrentValue
            }
            else if operation == "-" {
                operand = operand! - doubleFromCurrentValue
            }
            else if operation == "*" {
                operand = operand! * doubleFromCurrentValue
            }
            else if operation == "/" {
                operand = operand! / doubleFromCurrentValue
            }
            
            displayLabel.text = "\(operand!)"
            operation = nil
        }
        else {
            displayValue = nil
            displayLabel.text = "0"
        }
    }
    
    @IBAction func plusMinusTapped(_ sender: UIButton) {
        if let currentValue = displayValue, let doubleFromCurrentValue = Double(currentValue) {
            displayValue = "\(-1.0 * doubleFromCurrentValue)"
            displayLabel.text = "\(displayValue!)"
        }
        else {
            displayValue = nil
            displayLabel.text = "0"
        }
    }
    
    @IBAction func backspaceTapped(_ sender: UIButton) {
    /*    if let currentValue = displayValue {
            // Need to comply to Swift 3.0 and use offsetBy
          //displayValue = currentValue.substring(to: currentValue.endIndex.advancedBy(-1))

            
            if displayValue == "" {
                displayValue = "0"
            }
            
            displayLabel.text = displayValue
        }*/
    }
    
    
    // Symbol IBActions
    
    @IBAction func decimalTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "."
        }
        else {
            displayValue = "."
        }
        
        displayLabel.text = displayValue!
    }

    @IBAction func zeroTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "0"
        }
        else {
            displayValue = "0"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func oneTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "1"
        }
        else {
            displayValue = "1"
        }
        displayLabel.text = displayValue!
    }
    
    @IBAction func twoTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "2"
        }
        else {
            displayValue = "2"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func threeTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "3"
        }
        else {
            displayValue = "3"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func fourTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "4"
        }
        else {
            displayValue = "4"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func fiveTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "5"
        }
        else {
            displayValue = "5"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func sixTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "6"
        }
        else {
            displayValue = "6"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func sevenTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "7"
        }
        else {
            displayValue = "7"
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func eightTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "8"
        }
        else {
            displayValue = "8"
        }
        displayLabel.text = displayValue!

    }
    
    @IBAction func nineTapped(_ sender: UIButton) {
        if let currentValue = displayValue {
            displayValue = currentValue + "9"
        }
        else {
            displayValue = "9"
        }
        
        displayLabel.text = displayValue!
    }
}


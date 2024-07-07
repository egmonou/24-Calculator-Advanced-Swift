//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!)else {
               fatalError("can't convert dispaly labled to a dboule")
           }
            return number
        }set {
            displayLabel.text = String(newValue)
        }
    }
    

    private var calc = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
  
        calc.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let results = calc.calc(symbol: calcMethod) {
                displayValue = results
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let pressedValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text! = pressedValue
                isFinishedTypingNumber = false
            }else {
                if pressedValue == "."{
   
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += pressedValue
            }
        }
    }
}


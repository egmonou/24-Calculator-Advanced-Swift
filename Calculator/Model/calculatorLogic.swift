//
//  calculatorLogic.swift
//  Calculator
//
//  Created by administrator on 06/07/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    private var number: Double?
    
    private var intemediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calc(symbol: String) -> Double?{
        
        if let n = number {
            
        switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return perfromTowNumbCalculation(n2: n)
            default:
                intemediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    
    private func perfromTowNumbCalculation(n2: Double) -> Double? {
        
        if let n1 = intemediateCalculation?.n1, let operation = intemediateCalculation?.calcMethod {
          
            switch operation {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}

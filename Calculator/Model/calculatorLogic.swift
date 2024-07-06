//
//  calculatorLogic.swift
//  Calculator
//
//  Created by administrator on 06/07/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calc(symbol: String) -> Double?{
      
            if symbol == "+/-"{
                return number * -1
            } else if  symbol == "AC"{
                return 0
            }else if symbol == "%"{
                return number / 100
            }
        
        return nil
    }
    
}

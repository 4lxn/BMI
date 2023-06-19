//
//  CalculatorBrain.swift
//  BMI
//
//  Created by Alan Cervantes on 16/05/23.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    mutating func calculateBMI(height: Float, weight: Float) {
           let bmiValue = weight / (height * height)
           
           if bmiValue < 18.5 {
               bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(red: 0.16, green: 0.38, blue: 0.70, alpha: 1.00))
           } else if bmiValue < 24.9 {
               bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(red: 0.51, green: 0.79, blue: 0.30, alpha: 1.00))
           } else {
               bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 0.92, green: 0.23, blue: 0.14, alpha: 1.00))
           }
       }
       
    
    func getBMIValue() -> String{
        let bmiFixed = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFixed
        
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor(hue: 0, saturation: 0, brightness: 0.34, alpha: 1)
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "Just eat!"
    }
}


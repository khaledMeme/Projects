//
//  BMICalculator.swift
//  BMI-Calculator
//
//  Created by Khaled Meme on 2/8/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
struct BMICalculator{
    var bmi: BMI?
    mutating func calculateBMI(height : Float, weight : Float){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    func getBmiValue() -> String {
        let bmiToDecimalPlace = String(format: "%.1f", bmi!.value )
        return bmiToDecimalPlace
    }
    func getBmiAdvice() -> String {
        return bmi!.advice
        
    }
    func getBmiColor() ->  UIColor{
        return bmi!.color
    }
}

//
//  BMIVC.swift
//  BMI-Calculator
//
//  Created by Khaled Meme on 2/8/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class BMIVC: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculate = BMICalculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hieghtSliderPressed(_ sender: UISlider) {
        let chosed = String(format: "%0.1f", sender.value)
        heightLabel.text = chosed + "m"
    }
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        let chosed = String(format: "%0.0f", sender.value)
        weightLabel.text = chosed + "kg"
    }
    @IBAction func calculate(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculate.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultVC
            destinationVC.resultString = calculate.getBmiValue()
            destinationVC.myAdvice = calculate.getBmiAdvice()
            destinationVC.color = calculate.getBmiColor()
        }
    }
    
}

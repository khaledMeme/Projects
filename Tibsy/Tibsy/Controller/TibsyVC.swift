//
//  TibsyVC.swift
//  Tibsy
//
//  Created by Khaled Meme on 2/6/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class TibsyVC: UIViewController {
    var calculateBill = CalculateBill()

    @IBOutlet weak var BillTextField: UITextField!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    @IBOutlet weak var choosePerson: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func stepperButton(_ sender: UIStepper) {
        choosePerson.text = String(format:"%.0f",sender.value)
        calculateBill.people = sender.value
    }
    
    @IBAction func tibButtons(_ sender: UIButton) {
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
        calculateBill.tip = sender.currentTitle!
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        calculateBill.totalBill = Double(BillTextField.text!)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultVC
            destinationVC.people = Int(calculateBill.people ?? 2)
            destinationVC.tip = calculateBill.tip
            destinationVC.totalBill = calculateBill.billPerPerson
        }
    }
}

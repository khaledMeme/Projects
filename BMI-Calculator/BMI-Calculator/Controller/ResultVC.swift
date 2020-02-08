//
//  ResultVC.swift
//  BMI-Calculator
//
//  Created by Khaled Meme on 2/8/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    var resultString: String?
    var myAdvice: String?
    var color: UIColor?
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var advice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = resultString!
        advice.text = myAdvice!
        view.backgroundColor = color!
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

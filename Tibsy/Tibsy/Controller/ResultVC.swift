//
//  ResultVC.swift
//  Tibsy
//
//  Created by Khaled Meme on 2/6/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    var totalBill: String?
    var people: Int?
    var tip: String?
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var splitBill: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPerson.text = totalBill ?? "0.0"
        splitBill.text = "Split between \(people ?? 2) people, with \(tip ?? "0%") tip."
    }
    

    @IBAction func RecalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

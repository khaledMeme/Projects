//
//  CalculateBill.swift
//  Tibsy
//
//  Created by Khaled Meme on 2/6/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation

struct CalculateBill{
    var totalBill: Double?
    var people: Double?
    var tip: String?
    var doubleTip : Double{
        switch tip {
        case "0%":
            return 0.0
        case "10%":
            return 0.1
        case "20%":
            return 0.2
        default:
            return 0.0
        }
    }
    var billPerPerson: String {
        let bill = (doubleTip * (totalBill ?? 0.0)) + (totalBill ?? 0.0)
        print(bill)
        let billPerPersons = bill / (people ?? 2.0)
        return String(format: "%0.2f",billPerPersons)
    }
}

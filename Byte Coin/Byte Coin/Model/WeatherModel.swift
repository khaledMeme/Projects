//
//  WeatherModel.swift
//  Clima
//
//  Created by Khaled Meme on 2/4/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation
struct CoinModel {
    let name: String
    let price: Double
    
    var priceSting: String {
        return String(format: "%.2f", price)
    }
}

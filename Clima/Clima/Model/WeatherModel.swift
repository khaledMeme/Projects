//
//  WeatherModel.swift
//  Clima
//
//  Created by Khaled Meme on 2/4/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation
struct WeatherModel {
    let conditionId: Int
    let name: String
    let temperature: Double
    
    var temperatureSting: String {
        return String(format: "%.1f", temperature)
    }
    var conditionName: String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
    }
}

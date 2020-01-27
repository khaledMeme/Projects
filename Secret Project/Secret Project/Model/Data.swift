//
//  Data.swift
//  Secret Project
//
//  Created by Khaled Meme on 1/26/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation

struct Data {
    let title: String
    let subTitle: String
    let time: Int
    let APM: String
    init(title : String, subTitle: String, time: Int, APM: String) {
        self.title = title
        self.subTitle = subTitle
        self.time = time
        self.APM = APM
    }
}

//
//  UserDataManager.swift
//  Todoey
//
//  Created by Khaled Meme on 2/23/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation

protocol UserDataDelegate {
    func didUpdateData(with items:[Item])
    func didFailWithError(_ error: Error)
}
struct UserDataManager {
    var delegate: UserDataDelegate?
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    func saveItems(_ items: [Item]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath!)
        } catch {
            delegate?.didFailWithError(error)
        }
    }
    
    func getItems() {
        let decoder = PropertyListDecoder()
        if let data = try? Data(contentsOf: dataFilePath!){
            do {
                let items = try decoder.decode([Item].self, from: data)
                delegate?.didUpdateData(with: items)
            } catch {
                delegate?.didFailWithError(error)
            }
        }
    }
}

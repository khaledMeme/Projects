//
//  CoinVC.swift
//  Byte Coin
//
//  Created by Khaled Meme on 2/5/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class CoinVC: UIViewController {

    @IBOutlet weak var currencyTitle: UILabel!
    @IBOutlet weak var bitCoinPrice: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManager.fetchCoin(for:"AUD")
    }

}

//MARK:- UIPickerDataSource & UIPickerDelegate
extension CoinVC: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCoin(for: coinManager.currencyArray[row])
    }
}

//MARK:- CoinManagerDelegate

extension CoinVC: CoinManagerDelegate{
    func didUpdateWeather(coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitCoinPrice.text = coin.priceSting
            self.currencyTitle.text = coin.name
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

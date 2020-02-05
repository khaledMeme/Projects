//
//  WeatherManger.swift
//  Clima
//
//  Created by Khaled Meme on 2/3/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation
import CoreLocation
protocol CoinManagerDelegate {
    func didUpdateWeather(coin: CoinModel)
    func didFailWithError(_ error: Error)
}
struct CoinManager {
    var delegate: CoinManagerDelegate?
    let coinURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apikey = "?apikey=98DF436E-8EB6-44A4-AD25-691A6A6789CE"
    let currencyArray = ["AUD", "BRL","CAD"
        ,"CNY","EUR","GBP","HKD","IDR","ILS"
        ,"INR","JPY","MXN"
        ,"NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchCoin(for currency: String) {
        let urlString = coinURL + currency + apikey
        performRequest(for: urlString)
    }
    
    func performRequest(for urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, URLResponse, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: weatherData)
            let name = decodeData.asset_id_quote
            let price = decodeData.rate
            
            let coin = CoinModel(name: name, price: price)
            return coin
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}

//
//  WeatherManger.swift
//  Clima
//
//  Created by Khaled Meme on 2/3/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(_ error: Error)
}
struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d80e2131874c957f1d985e697854870f&units=metric"
    func fetchWeather(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees) {
        let urlString = weatherURL + "&lat=\(lat)&lon=\(lon)"
        performRequest(for: urlString)
    }
    func fetchWeather(cityName: String) {
        let urlString = weatherURL + "&q=" + cityName
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
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            
            let weather = WeatherModel(conditionId: id, name: name, temperature: temp)
            return weather
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}

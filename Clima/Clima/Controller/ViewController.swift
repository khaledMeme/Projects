//
//  ViewController.swift
//  Clima
//
//  Created by Khaled Meme on 2/3/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {
    
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManager = WeatherManager()
    var locationManger = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
    }
    
    
    
    
}

//MARK:- TextFieldDelegate
extension ViewController: UITextFieldDelegate{
    @IBAction func getLocationButton(_ sender: UIButton) {
        locationManger.requestLocation()
    }
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }
        else{
            searchTextField.placeholder = "Type somthing"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
}
//MARK:- WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.name
            self.conditionImage.image = UIImage(systemName: weather.conditionName)
            self.tempratureLabel.text = weather.temperatureSting
        }
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
//MARK:- CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManger.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            weatherManager.fetchWeather(latitude, longitude)
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

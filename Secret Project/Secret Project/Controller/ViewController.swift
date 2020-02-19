//
//  ViewController.swift
//  Secret Project
//
//  Created by Khaled Meme on 1/26/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {
    var weatherManager = WeatherManager()
    var locationManger = CLLocationManager()
    var didDisplay = Array(repeating: false, count: 3)
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    @IBOutlet weak var button: UIButtonX!
    @IBOutlet weak var pencil: UIButton!
    @IBOutlet weak var chat: UIButton!
    @IBOutlet weak var alarm: UIButton!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchTextField.delegate = self
        closeMenu()
        weatherManager.delegate = self
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
        getDate()
        dateAndWeather()
    }
    
    @IBAction func floatingActionButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            if self.menuView.transform == .identity{
                self.closeMenu()
            }
            else{
                self.menuView.transform = .identity
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity {
                self.pencil.transform = .identity
                self.chat.transform = .identity
                self.alarm.transform = .identity
            }
        }, completion: nil)
    }
    func getDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "LLLL"
        let month = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "dd.yyyy"
        let result = dateFormatter.string(from: date)
        dayName.text = day
        dateLable.text = "\(month) \(result)"
    }
    func dateAndWeather(){
        dateView.transform = CGAffineTransform(translationX: -300, y: 0)
        weatherView.transform = CGAffineTransform(translationX: 300, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.dateView.transform = .identity
            self.weatherView.transform = .identity
        }, completion: nil)
    }
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        pencil.transform = CGAffineTransform(translationX: 0, y: 15)
        chat.transform = CGAffineTransform(translationX: 11, y: 11)
        alarm.transform = CGAffineTransform(translationX: 15, y: 0)
    }
}

//MARK:- TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        return cell
    }
    
    
}
//MARK:- TableViewDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if !didDisplay[row]{
            didDisplay[row] = true
            cell.transform = CGAffineTransform(translationX: 300, y: 0)
            UIView.animate(withDuration: 0.4, delay: 0.5 + (0.1 * Double(row)), usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            }, completion: nil)
        }
    }
}
//MARK:- WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityName.text = weather.name
            self.conditionImage.image = UIImage(systemName: weather.conditionName)
            self.temp.text = weather.temperatureSting
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
//MARK:- TextFieldDelegate
extension ViewController: UITextFieldDelegate{
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

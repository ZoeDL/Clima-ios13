//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchBar.endEditing(true)
    }
    // hide keyboard when enter key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter a city name"
            return false
        }
    }
    
    // get the user input for fetching weather data and then clear it
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = textField.text {
            weatherManager.fetchWeatherData(cityName: cityName)
        }
        textField.text = ""
        textField.placeholder = "Search"
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    func weatherDataDidUpdate(_ weatherManager: WeatherManager,  weatherModel: WeatherModel) {
        // Dispatch the call to update the label text to the main thread.
        DispatchQueue.main.async {
            self.temperatureLabel.text =  weatherModel.temperatureString
            self.conditionImageView.image = UIImage(systemName: weatherModel.iconName)
            self.cityLabel.text = weatherModel.cityName
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}


extension WeatherViewController:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print(lat)
            print(lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error)")
    }
}

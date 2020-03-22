//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        weatherManager.delegate = self
    }

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
    
    func weatherDataDidUpdate(_ weatherManager: WeatherManager,  weatherModel: WeatherModel) {
        print(weatherModel.temperature)
    }
}


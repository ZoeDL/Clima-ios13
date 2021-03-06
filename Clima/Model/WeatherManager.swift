//
//  WeatherManager.swift
//  Clima
//
//  Created by 余泽熙 on 3/21/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func weatherDataDidUpdate(_ weatherManager: WeatherManager, weatherModel: WeatherModel)
    
    func didFailWithError(_ error: Error)
}


struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let url = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=131ecdd5023e48e230e0ea0ffc94d462&"
    
    func fetchWeatherData(cityName: String) {
        let weatherURL = "\(url)q=\(cityName)"
        performRequest(weatherURL)
    }
    
    func fetchWeatherData(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        let weatherURL = "\(url)lat=\(latitude)&lon=\(longtitude)"
        performRequest(weatherURL)
    }
    
    func performRequest(_ weatherURL: String) {
        // 1. create a URL
        if let url = URL(string: weatherURL) {
            // 2. create a URL session
            let session = URLSession(configuration: .default)
            // 3. give the session a tack using closure
            let task = session.dataTask(with: url) { (data, URLResponse, error) in
                if(error != nil) {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    let weatherModel = self.parseJSON(weatherData: safeData)
                    if let safeWeatherModel = weatherModel {
                        self.delegate?.weatherDataDidUpdate(self, weatherModel: safeWeatherModel)
                    }
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let id = decodedData.weather[0].id
            let weatherModel = WeatherModel(cityName: cityName, temperature: temperature, id: id)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }

    
}

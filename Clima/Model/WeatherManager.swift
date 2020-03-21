//
//  WeatherManager.swift
//  Clima
//
//  Created by 余泽熙 on 3/21/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=131ecdd5023e48e230e0ea0ffc94d462&q="
    
    func fetchWeatherData(cityName: String) {
        let weatherURL = "\(url)\(cityName)"
        performRequest(weatherURL)
    }
    
    func performRequest(_ weatherURL: String) {
        // 1. create a URL
        if let url = URL(string: weatherURL) {
            // 2. create a URL session
            let session = URLSession(configuration: .default)
            // 3. give the session a tack
            let task = session.dataTask(with: url, completionHandler: handler(data: URLResponse: error:))
            // 4. start the task
            task.resume()
        }
    }
    
    func handler(data: Data?, URLResponse: URLResponse?, error: Error?) {
        if(error != nil) {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}

//
//  WeatherModel.swift
//  Clima
//
//  Created by 余泽熙 on 3/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let id: Int
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    var iconName: String {
        switch id {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
        }
    }
}

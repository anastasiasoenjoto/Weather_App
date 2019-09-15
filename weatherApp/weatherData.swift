//
//  weatherData.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 8/30/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

struct WeatherData2 {
    let currentWeather: CurrentWeatherData
    let forecast: WeatherData
}

struct CurrentWeatherData: Codable {
    let weather: [CurrentWeather]
    let main: Temp
    let name: String
    let wind: Wind
    let clouds: Cloud
    
}

struct Cloud: Codable {
    let all: Int
}
struct Wind: Codable {
    let speed: Double
}
struct CurrentWeather: Codable {
    let description: String
}

struct Temp: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let minTemp: Double
    let maxTemp: Double

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}

struct WeatherData: Codable {
    let city: CityData
    let hourlyData: [HourlyData]
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case hourlyData = "list"
    }
}

struct HourlyData: Codable {
    let time: Double
    let temp: TempData
    let description: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case temp = "main"
        case description = "weather"
    }
}

struct Weather: Codable {
    let description: String
}

struct TempData: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct CityData: Codable {
    let name: String
    let country: String
    let timezone: Int
}

struct Page {
    let forecast: [HourlyData]
    var isOpen: Bool = false
}

enum Days: Int {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
    var name: String {
        switch self {
        case .Monday:
            return "Monday"
        case .Tuesday:
            return "Tuesday"
        case .Wednesday:
            return "Wednesday"
        case .Thursday:
            return "Thursday"
        case .Friday:
            return "Friday"
        case .Saturday:
            return "Saturday"
        case .Sunday:
            return "Sunday"
        }
    }
}

struct PageData {
    let type: String
    let value: String?
    let image: UIImage
}

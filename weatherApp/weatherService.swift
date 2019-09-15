//
//  weatherService.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/4/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

class weatherService {
   
    func getWeatherData(city: String, completion: @escaping(WeatherData?, Error?) ->Void) {
        let newCity = city.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(newCity)&units=metric&appid=fbe5fbc6f937ee5ad7cbf73f0bfffdf0") else {
            print("Error: cannot create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error occured")
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(weatherData, nil)
            } catch let jsonErr{
                print("Error serializing json", jsonErr)
                completion(nil, jsonErr)
            }
            }.resume()
    }
    
    func getCurrentWeather(city: String, completion: @escaping(CurrentWeatherData?, Error?) ->Void) {
        let newCity = city.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(newCity)&units=metric&appid=fbe5fbc6f937ee5ad7cbf73f0bfffdf0") else {
            print("Error: cannot create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error occured")
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let weatherData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                completion(weatherData, nil)
            } catch let jsonErr{
                print("Error serializing json", jsonErr)
                completion(nil, jsonErr)
            }
            }.resume()
    }
}

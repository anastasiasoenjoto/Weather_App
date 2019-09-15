//
//  detailedWeatherViewModel.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/14/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

public class detailedWeatherViewModel: NSObject {
    
    var currentDay: String = ""
    
    func getPageData(hourly: [HourlyData], timeZone: Int) -> [Page] {
        var previousTime = ""
        var result: [HourlyData] = []
        var page: [Page] = []
        
        hourly.forEach {
            let time = $0.time
            let currentTime = calculateDate(time: time, timeZone: timeZone)
            
            
            if currentTime != previousTime {
                
                if !result.isEmpty {
                    page.append(Page(forecast: result, isOpen: false))
                }
                result = [$0]
                previousTime = currentTime
            }
            else {
                result.append($0)
            }
        }
        return page
    }
    
    func calculateDate(time: Double, timeZone: Int) -> String {
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let rawValue = calendar.component(.weekday, from: date)
        if let day = Days(rawValue: rawValue)?.name{
            currentDay = day
        }
        return dateFormatter.string(from: date)
    }
    
    func calculateTime(time: Double, timeZone: Int) -> String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
}

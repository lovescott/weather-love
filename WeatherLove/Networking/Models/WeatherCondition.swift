//
//  WeatherCondition.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct WeatherCondition {
    var temp: Int?
    var iconName: String
    var forecast: String
    var humidity: Int?
}

extension WeatherCondition{
    init?(_ dictionary: JSONDictionary) {
       guard let temp = dictionary["main"]?["temp"] as? Double,
        let weather = dictionary["weather"] as? [JSONDictionary],
        let icon = weather[0]["icon"] as? String,
        let forecast = weather[0]["description"] as? String,
        let humidity = dictionary["main"]?["humidity"] as? Double
        else{ return nil }
        self.temp = Int(temp)
        self.iconName = icon
        self.forecast = forecast
        self.humidity = Int(humidity)
    }
}

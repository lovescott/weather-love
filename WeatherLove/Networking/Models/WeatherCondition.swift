//
//  WeatherCondition.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct WeatherCondition {
    var temp: Double
}

extension WeatherCondition{
    init?(_ dictionary: JSONDictionary) {
        guard let temp = dictionary["main"]?["temp"] as? Double else { return nil }
        self.temp = temp
    }
}

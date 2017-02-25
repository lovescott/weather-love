//
//  WeatherConditionResource.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct WeatherConditionResource {
    static let url = URL(string: Keys.baseWeatherUrl)!
    
    static let get = Resource<WeatherCondition>(url: url, parseJSON: { json in
        guard let dictionary = json as? JSONDictionary else { return nil }
        return WeatherCondition(dictionary)
    })
}

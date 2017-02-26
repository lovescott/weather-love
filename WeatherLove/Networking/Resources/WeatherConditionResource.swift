//
//  WeatherConditionResource.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation


struct WeatherConditionResource {
    let url = URL(string: Keys.baseWeatherUrl)
    
    func get (for id:Int) -> Resource<WeatherCondition>?{
        //TODO: This is here because of time...Ideally I would set up query params with normal URL Components
        let urlString = Keys.baseWeatherUrl.replacingOccurrences(of: "[[id]]", with: String(id))
        guard let url = URL(string: urlString) else { return nil}
        return Resource<WeatherCondition>(url: url, parseJSON: { json in
            guard let dictionary = json as? JSONDictionary else { return nil }
            return WeatherCondition(dictionary)
        })
    }
}

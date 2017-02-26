//
//  CityResource.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct CityResource {
   
    // This Loads data from data from http://bulk.openweathermap.org/sample/city.list.us.json.gz which is
    // a list of the current US cites supported by OpenWeatherMap.  I think this would not be production ready but this
    // would be a good start for a dynamic service.
    // There are many key points missing like state that make this not ready for primetime
    func retrieveData()-> [JSONDictionary]?   {
        if let path = Bundle.main.path(forResource: "city", ofType: "json")
        {
            if let data = try? NSData(contentsOfFile: path, options: .dataReadingMapped)
            {
                let json = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions()) as? [JSONDictionary]
                return json?.flatMap{$0}

            }
        }
        return nil
    }
}

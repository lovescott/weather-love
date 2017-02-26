//
//  CityResource.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct CityResource {
    
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

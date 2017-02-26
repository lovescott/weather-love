//
//  City.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

struct City {
    let id: Int
    let name: String
}

extension City{
    init?(_ json: JSONDictionary){
        guard let id = json ["_id"] as? Int, let name = json["name"] as? String else {
            return nil
        }
        self.id = id
        self.name = name
    }
}

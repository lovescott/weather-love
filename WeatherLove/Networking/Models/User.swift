//
//  User.swift
//  WeatherLove
//
//  Created by Scott Love on 2/26/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

class User {
    var lastCityId: Int? {
        get {
            return UserDefaults.standard.value(forKey: "CityId") as? Int
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "CityId")
        }
    }
    
    var lastCityName: String? {
        get {
            return UserDefaults.standard.value(forKey: "CityName") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "CityName")
        }
    }
}

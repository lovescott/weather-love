//
//  CitySearchViewModel.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

final class CitySearchViewModel {
    var weatherVM: WeatherViewModelType
    let cities = ["Dallas", "Richmond", "Houston"]
    var filterCities = [String]()
    
    init(weatherVM: WeatherViewModelType) {
        self.weatherVM = weatherVM
    }
    
}

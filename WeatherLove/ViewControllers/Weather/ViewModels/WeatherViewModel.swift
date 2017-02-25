//
//  WeatherViewModel.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

final class WeatherViewModel: WeatherViewModelType {
    var weatherConditions: WeatherConditions
    
    init(){
        weatherConditions = WeatherConditions(temp: 80)
    }
}

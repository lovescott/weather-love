//
//  WeatherViewModelType.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

protocol WeatherViewModelType {
    //TODO: Refactor ?
    var weatherCondition: WeatherCondition?{ get}
    var selectedCity: City? { get set }
    func updateCity()
}

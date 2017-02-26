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
    var cities: [City] = [City]()
    var filterCities = [City]()
    
    init(weatherVM: WeatherViewModelType) {
        self.weatherVM = weatherVM
        loadCities()
    }
    
    func loadCities() {
        if let cities = CityResource().retrieveData(){
            self.cities = cities.flatMap {City.init($0)}
        }
    }
    
    
}

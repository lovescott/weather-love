//
//  WeatherViewModel.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

final class WeatherViewModel: WeatherViewModelType {
    //TODO: Check this in refactor
    private weak var delegate: WeatherViewControllerDelegate?
    var weatherCondition: WeatherCondition?
    var selectedCity: City?{
        didSet{
            downloadWeatherCondition()
        }
    }
    
    init(delegate: WeatherViewControllerDelegate?){
        self.delegate = delegate
        downloadWeatherCondition()
    }
    
    func updateCity (){
        let cityVm = CitySearchViewModel(weatherVM: self)
        delegate?.changeWeatherCity(viewModel:cityVm)
    }
    func downloadWeatherCondition() {
        Webservice().load(resource: WeatherConditionResource.get){[weak self] result in
            guard let result = result, let `self` = self else {
                return
            }
            self.weatherCondition = result
        }
    }
}

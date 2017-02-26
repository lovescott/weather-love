//
//  WeatherViewModel.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation

// TODO: I ran out of time, but ideally there are some missed opertunities to
// catch errors and handle failures between network calls and UI

final class WeatherViewModel: WeatherViewModelType {
    private weak var delegate: WeatherViewControllerDelegate?
    var weatherCondition: WeatherCondition?
    var selectedCity: City?{
        didSet{
            downloadWeatherCondition()
            User().lastCityId = selectedCity?.id
            User().lastCityName = selectedCity?.name
        }
    }
    var iconData: Data?
    
    init(delegate: WeatherViewControllerDelegate?){
        self.delegate = delegate
        downloadWeatherCondition()
        checkForLastCitySet()
    }
    
    func updateCity (){
        let cityVm = CitySearchViewModel(weatherVM: self)
        delegate?.changeWeatherCity(viewModel:cityVm)
    }
    
    func checkForLastCitySet(){
        if let id = User().lastCityId, let name = User().lastCityName{
            selectedCity = City(id: id, name: name)
        }
    }
    
    func downloadWeatherCondition() {
        if let city = selectedCity, let resource = WeatherConditionResource().get(for: city.id){
            Webservice().load(resource: resource) {[weak self] result in
                guard let result = result, let `self` = self else {
                    return
                }
                self.weatherCondition = result
                DispatchQueue.main.async { [unowned self] in
                    self.delegate?.updateUI()
                }
                self.downloadImage(iconName: result.iconName)
            }
        }
    }
    
    func downloadImage(iconName: String) {
        Webservice().getData(for: iconName) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.iconData = data
                self.delegate?.loadIcon()
            }
        }
    }
}

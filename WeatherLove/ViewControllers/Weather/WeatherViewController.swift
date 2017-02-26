//
//  WeatherViewController.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

protocol WeatherViewControllerDelegate: class {
    func changeWeatherCity(viewModel: CitySearchViewModel)
    func updateUI()
    func loadIcon ()
}

class WeatherViewController: UIViewController {
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherIcon: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var rainLabel: UILabel!
    @IBOutlet var forcastShortLabel: UILabel!
    @IBOutlet var setLocationButton: UIButton!
    
    var viewModel: WeatherViewModelType!
    
    convenience init(viewModel: WeatherViewModelType) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setLocationButton.layer.borderColor = UIColor.white.cgColor
        setLocationButton.layer.cornerRadius = 5
        setLocationButton.layer.borderWidth = 2.0
    }
    
    @IBAction func onSetLocation(_ sender: Any) {
        viewModel.updateCity()
    }
    func setupUI () {
        
        if let city = viewModel.selectedCity,
            let temp = viewModel.weatherCondition?.temp,
            let humidity = viewModel.weatherCondition?.humidity{
            self.cityLabel.text = city.name
            self.tempLabel.text = "\(temp)"
            self.humidityLabel.text = "\(humidity) %"
            self.forcastShortLabel.text = viewModel.weatherCondition?.forecast.localizedCapitalized ?? ""
        }else {
            self.cityLabel.text = "Please select a city"
            self.tempLabel.text = "---"
            self.humidityLabel.text = "--- %"
            self.forcastShortLabel.text = ""
            
        }
    }
    
    func setupIcon(){
        let image = UIImage(data: viewModel.iconData!)
        weatherIcon.image = image
    }
}

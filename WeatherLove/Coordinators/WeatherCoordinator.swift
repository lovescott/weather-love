//
//  WeatherCoordinator.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

final class WeatherCoordinator: Coordinator {
    
    func start() {
        let viewModel = WeatherViewModel(delegate: self)
        let viewController = WeatherViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //TODO: Build Stop for Deinit
}

extension WeatherCoordinator: WeatherViewControllerDelegate {
    func changeWeatherCity(viewModel: CitySearchViewModel){
        let rootVc = navigationController?.childViewControllers[0]
        let vc = CitySearchViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overCurrentContext
        rootVc?.present(nc, animated: true, completion: nil)
    }
}

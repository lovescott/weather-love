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
        let viewModel = WeatherViewModel()
        let viewController = WeatherViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

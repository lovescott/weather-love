//
//  AppCoordinator.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    func start() {
        let coordinator = WeatherCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

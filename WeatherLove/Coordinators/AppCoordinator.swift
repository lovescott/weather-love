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
        let coordinator = WeatherCoordinator(navigationController: navigationController, appCoordinator:self)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    //TODO: Check with this and make sure child coordinators clean up after themselves
    func weatherCoordinatorCompleted(coordinator: WeatherCoordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

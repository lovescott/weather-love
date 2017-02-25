//
//  Coordinator.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//


import Foundation
import UIKit

class Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

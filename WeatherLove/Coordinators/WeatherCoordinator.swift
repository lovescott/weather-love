//
//  WeatherCoordinator.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

final class WeatherCoordinator: Coordinator {
    weak var appCoordinator: AppCoordinator?
    
    convenience init(navigationController: UINavigationController?, appCoordinator: AppCoordinator?) {
        self.init(navigationController: navigationController)
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        let viewModel = WeatherViewModel(delegate: self)
        let viewController = WeatherViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //TODO: Check this when app grows to ensure proper child coordinator managment
    func stop() {
        _ = navigationController?.popViewController(animated: true)
        appCoordinator?.weatherCoordinatorCompleted(coordinator: self)
    }
}

extension WeatherCoordinator: WeatherViewControllerDelegate {
    func changeWeatherCity(viewModel: CitySearchViewModel){
        let rootVc = navigationController?.childViewControllers[0]
        let vc = CitySearchViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overCurrentContext
        rootVc?.present(nc, animated: true, completion: nil)
    }
    
    func updateUI (){
        let rootVc = navigationController?.childViewControllers[0] as? WeatherViewController
        rootVc?.setupUI()
    }
    
    func loadIcon (){
        let rootVc = navigationController?.childViewControllers[0] as? WeatherViewController
        rootVc?.setupIcon()
    }
}

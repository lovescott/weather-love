//
//  AppDelegate.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        //TODO: Make sure this is working
        UIApplication.shared.statusBarStyle = .lightContent
        let navigationController = UINavigationController()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        window?.rootViewController = navigationController
        let coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.start()
        self.coordinator = coordinator
        window?.makeKeyAndVisible()
        return true
    }
}


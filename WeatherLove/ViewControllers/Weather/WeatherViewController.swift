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
}

class WeatherViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var viewModel: WeatherViewModelType!
    
    convenience init(viewModel: WeatherViewModelType) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSearch(_ sender: Any) {
        viewModel.updateCity()
    }
}

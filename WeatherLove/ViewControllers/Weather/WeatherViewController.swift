//
//  WeatherViewController.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var viewModel: WeatherViewModelType!
    
    convenience init(viewModel: WeatherViewModelType) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

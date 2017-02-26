//
//  CitySearchViewController.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

class CitySearchViewController: UITableViewController{
    
    var viewModel: CitySearchViewModel!
    
    var resultsController = UISearchController()
    let reuseIdentifier = "cell"
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(style: UITableViewStyle){
        super.init(style: style)
    }
    
    convenience init(viewModel: CitySearchViewModel){
        self.init(style: .plain)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search for City"
        
        resultsController = UISearchController(searchResultsController: nil)
        resultsController.searchResultsUpdater = self
        resultsController.obscuresBackgroundDuringPresentation = false
        resultsController.hidesNavigationBarDuringPresentation = false
        resultsController.searchBar.sizeToFit()
        resultsController.searchBar.delegate = self
        
        tableView.tableHeaderView = resultsController.searchBar
        tableView.tableFooterView = footerView
        tableView.register(CityCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.reloadData()
   }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resultsController.isActive = true
        //This seems hackish but honestly the only way to get keyboard to take control
        DispatchQueue.main.async { [unowned self] in
            self.resultsController.searchBar.becomeFirstResponder()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.filterCities[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resultsController.isActive = false
        viewModel.weatherVM.selectedCity = viewModel.filterCities[indexPath.row]
        self.dismiss(animated: true, completion: nil)
    }
}

extension CitySearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let array = viewModel.cities.filter {$0.name.contains(searchController.searchBar.text!)}
        viewModel.filterCities = array
        tableView.reloadData()
    }
}

extension CitySearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

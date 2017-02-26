//
//  CitySearchViewController.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import UIKit

class CitySearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate{
    let cities = ["Dallas", "Richmond", "Houston"]
    var filterCities = [String]()
    var resultsController = UISearchController()
    let reuseIdentifier = "cell"
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
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
        return filterCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = filterCities[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Dissmiss is not working right now
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterCities.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (cities as NSArray).filtered(using: searchPredicate)
        
        filterCities = array as! [String]
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  searchViewController.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/5/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit

protocol searchViewControllerDelegate {
    func passWeather(weather: CurrentWeatherData)
}

class searchViewController: UIViewController {
    
    var isSearching = false
    let service = weatherService()
    var delegate: searchViewControllerDelegate?
    var tableViewData: [CurrentWeatherData] = []
    let mainView = searchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view = mainView
        view.backgroundColor = .white
        self.edgesForExtendedLayout = []
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableViewData = []
    }
    
    func setUp() {
        mainView.searchWeather.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    
    func getCurrentWeather(city: String) {
        let data = service.getCurrentWeather(city: city) { (data, error) in
            if let weatherData = data {
                self.tableViewData.append(weatherData)
                DispatchQueue.main.async {
                    self.mainView.tableView.reloadData()
                }
            }
        }
    }
}

extension searchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if mainView.searchWeather.text == nil || mainView.searchWeather.text == ""{
            isSearching = false
            tableViewData = []
            mainView.tableView.reloadData()
            
        }
        else {
            isSearching = true
            guard let city = mainView.searchWeather.text else { return }
            getCurrentWeather(city: city)
        }
        
    }
}

extension searchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tableViewData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passWeather(weather: tableViewData[indexPath.row])
        navigationController?.popViewController(animated: true)
        
    }
}



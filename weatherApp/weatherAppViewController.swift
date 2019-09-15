//
//  weatherAppViewController.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 8/15/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit



class weatherAppViewController: UIViewController {

    let mainView = weatherAppMainView()
    let detailedView = detailedWeatherView()
    var savedCities: [CurrentWeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func createNew() {
        let vc = searchViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUp() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(weatherTableViewCell.self, forCellReuseIdentifier: "tableViewCellId")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNew))
        self.edgesForExtendedLayout = []
    }
}

extension weatherAppViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedCities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: "tableViewCellId", for: indexPath) as? weatherTableViewCell else {return UITableViewCell()}
        cell.cityLabel.text = savedCities[indexPath.row].name
        let temp = Int(savedCities[indexPath.row].main.temp)
        cell.tempLabel.text = "\(temp)°C"

        
        if let image =  UIImage(named: "plainBlue") {
            cell.backgroundColor = UIColor(patternImage: image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(detailedWeatherViewController(weatherData: savedCities[indexPath.row]), animated: true)
    }
    
}

extension weatherAppViewController: searchViewControllerDelegate {
    
    func passWeather(weather: CurrentWeatherData) {
        let cities = savedCities.map {
            $0.name
        }
        
        if !cities.contains(weather.name) {
            savedCities.append(weather)
            mainView.tableView.reloadData()
        }
    }
    
    
    
}

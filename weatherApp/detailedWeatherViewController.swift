//
//  detailedWeatherViewController.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 8/30/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit


class detailedWeatherViewController: UIViewController {

    let mainView = detailedWeatherView()
    let currentWeather: CurrentWeatherData
    let service = weatherService()
    var page: [Page] = []
    var currentIdx: Int = 0
    var timeZone: Int = 0
    var pageData: [PageData] = []
    let viewModel = detailedWeatherViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setUp()
        getWeatherData(city: currentWeather.name)
    }
    
    init(weatherData: CurrentWeatherData) {
        currentWeather = weatherData
        pageData = [PageData(type: "Pressure", value: "\(currentWeather.main.pressure)hPa", image: UIImage(named: "pressure")!), PageData(type: "Humidity", value: "\(currentWeather.main.humidity)%", image: UIImage(named: "humidity")!), PageData(type: "Wind Speed", value: "\(currentWeather.wind.speed)m/sec", image: UIImage(named: "wind")!), PageData(type: "Cloud", value: "\(currentWeather.clouds.all)%", image: UIImage(named: "cloud")!)]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        mainView.descriptionLabel.text = currentWeather.weather[0].description
        let temp = Int(currentWeather.main.temp)
        mainView.temperatureLabel.text = "\(temp)°"
        mainView.cityLabel.text = currentWeather.name
        
        guard let image = UIImage(named: "plainBlue") else { return }
        view.backgroundColor = UIColor(patternImage: image)
    }
    
    func setUp() {
        setUpTableView()
        setUpCollectionView()
        setUpView()
        navigationController?.setNavigationBarHidden(true, animated: true)
        mainView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    func setUpTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(detailedTableViewCell.self, forCellReuseIdentifier: "tableViewCellId")
        
    }
    
    func setUpCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(detailedCollectionViewCell.self, forCellWithReuseIdentifier: "mainViewCellID")
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func openClose(button: UIButton) {
        let section = button.tag
        currentIdx = button.tag
        let isOpen = page[section].isOpen
        page[section].isOpen = !isOpen
        
        if isOpen {
            mainView.tableView.deleteRows(at: [IndexPath(row:0, section: section)], with: .fade)
        }
        else {
             mainView.tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .fade)
        }
    }
    
    func getWeatherData(city: String) {
        let data = service.getWeatherData(city: city) { (data, error) in
            if let weatherData = data {
                self.timeZone = weatherData.city.timezone
                self.page = self.viewModel.getPageData(hourly: weatherData.hourlyData, timeZone: weatherData.city.timezone)
                DispatchQueue.main.async {
                    self.mainView.tableView.reloadData()
                }
            }
        }
    }
}

extension detailedWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return page[section].isOpen ? 1 : 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return page.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: "tableViewCellId", for: indexPath) as? detailedTableViewCell else { return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.setCollectionViewDelegate(dataSourceDelegate: self, row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        headerView.addTarget(self, action: #selector(openClose), for: .touchUpInside)
        headerView.tag = section
        viewModel.calculateDate(time: page[section].forecast[0].time, timeZone: timeZone)
        headerView.dayLabel.text = viewModel.currentDay
        return headerView
    }
    

}

extension detailedWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == mainView.collectionView ? pageData.count : page[currentIdx].forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCellID", for: indexPath) as? detailedCollectionViewCell else { return UICollectionViewCell()}
            cell.iconImageView.image = pageData[indexPath.item].image
            cell.typeLabel.text = pageData[indexPath.item].type
            cell.valueLabel.text = pageData[indexPath.item].value
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as? weatherCollectionViewCell else { return UICollectionViewCell()}
        let time = viewModel.calculateTime(time: page[currentIdx].forecast[indexPath.item].time, timeZone: timeZone)
        cell.timeLabel.text = time
        cell.tempLabel.text = "\(Int(page[currentIdx].forecast[indexPath.item].temp.temp))°"
        
        return cell
    }
    
    
}

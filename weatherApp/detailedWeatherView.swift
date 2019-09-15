//
//  detailedWeatherView.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 8/15/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit

class detailedWeatherView: UIView {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        
        return label
        
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill

        
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        tableView.backgroundColor = .clear
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        
        
        return tableView
    }()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        flowLayout.minimumLineSpacing = 15
        collectionView.showsHorizontalScrollIndicator = false
        flowLayout.itemSize = CGSize(width: 150, height: 200)
        collectionView.backgroundColor = .clear
        
        
        
        return collectionView
        
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
       
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        addSubview(temperatureLabel)
        addSubview(descriptionLabel)
        addSubview(tableView)
        addSubview(cityLabel)
        addSubview(collectionView)
        addSubview(backButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let constraints = [
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            cityLabel.heightAnchor.constraint(equalToConstant: 70),
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 70),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 75),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backButton.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: -25),
            backButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            backButton.leftAnchor.constraint(equalTo: backButton.rightAnchor,constant: -25),
            backButton.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

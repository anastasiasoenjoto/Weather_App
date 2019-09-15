//
//  searchView.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/14/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

class searchView: UIView {
    
    let searchWeather: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.placeholder = "Enter city"
        bar.returnKeyType = UIReturnKeyType.done
        
        return bar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchWeather)
        addSubview(tableView)
       
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        let constraint = [
            searchWeather.leftAnchor.constraint(equalTo: self.leftAnchor),
            searchWeather.rightAnchor.constraint(equalTo: self.rightAnchor),
            searchWeather.topAnchor.constraint(equalTo: self.topAnchor),
            searchWeather.heightAnchor.constraint(equalToConstant: 100),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.topAnchor.constraint(equalTo: searchWeather.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
}


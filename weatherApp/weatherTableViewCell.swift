//
//  weatherTableViewCell.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 8/15/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

class weatherTableViewCell: UITableViewCell {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = label.font.withSize(20)
        
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(cityLabel)
        addSubview(tempLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let constraints = [
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cityLabel.rightAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: self.topAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tempLabel.leftAnchor.constraint(equalTo: tempLabel.rightAnchor, constant: -90),
            tempLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}

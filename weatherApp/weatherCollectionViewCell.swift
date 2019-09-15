//
//  weatherCollectionViewCell.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/12/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit

class weatherCollectionViewCell: UICollectionViewCell {
   
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        //label.backgroundColor = .blue
        label.textAlignment = .center
        
        return label
        
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        //label.backgroundColor = .green
        label.textAlignment = .center
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(timeLabel)
        addSubview(tempLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let constraint = [
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
        timeLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
        timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
        tempLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
        tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        tempLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
        tempLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}

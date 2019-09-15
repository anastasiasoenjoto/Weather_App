//
//  HeaderView.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/12/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIButton {
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        label.text = "Monday"
        
        return label
        
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        addSubview(tempLabel)
        if let image = UIImage(named: "plainBlue"){
             self.backgroundColor = UIColor(patternImage:image )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let constraint = [
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dayLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            dayLabel.rightAnchor.constraint(equalTo: dayLabel.leftAnchor, constant: 150),
            tempLabel.topAnchor.constraint(equalTo: self.topAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tempLabel.leftAnchor.constraint(equalTo: tempLabel.rightAnchor, constant: -200),
            tempLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
}

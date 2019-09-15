//
//  detailedCollectionViewCell.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/14/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit

class detailedCollectionViewCell: UICollectionViewCell {
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        return label
        
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        return label
        
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(typeLabel)
        addSubview(valueLabel)
        addSubview(iconImageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let constraint = [
            typeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 50),
            typeLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            typeLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            iconImageView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            iconImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            valueLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}

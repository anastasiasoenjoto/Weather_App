//
//  detailedTableViewCell.swift
//  weatherApp
//
//  Created by Anastasia Riawan Soenjoto on 9/12/19.
//  Copyright © 2019 Anastasia Riawan Soenjoto. All rights reserved.
//

import UIKit

class detailedTableViewCell: UITableViewCell {

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        flowLayout.minimumLineSpacing = 15
        collectionView.showsHorizontalScrollIndicator = false
        flowLayout.itemSize = CGSize(width: 75, height: 100)
        collectionView.backgroundColor = .clear
        
        
        return collectionView
        
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(collectionView)
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setCollectionViewDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, row: Int) {
        collectionView.register(weatherCollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }

}

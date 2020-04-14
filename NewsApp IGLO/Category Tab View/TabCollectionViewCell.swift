//
//  TabCollectionViewCell.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    func initView() {
        let whiteView = UIView(frame: bounds)
        whiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor.black.cgColor
        whiteView.layer.cornerRadius = 10
        self.backgroundView = whiteView
        
        let grayView = UIView(frame: bounds)
        grayView.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        grayView.layer.borderWidth = 1
        grayView.layer.borderColor = UIColor.black.cgColor
        grayView.layer.cornerRadius = 10
        self.selectedBackgroundView = grayView
        
        self.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

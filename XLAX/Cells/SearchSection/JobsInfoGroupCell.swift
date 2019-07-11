//
//  JobsInfoGroupCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/7/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobsInfoGroupCell : UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Who We Are", font: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 30)!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        addCardViewController()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCardViewController() {
        let cardView = cardInfoController()
        addSubview(cardView.view)
        cardView.view.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: -15, paddingRight: -15, width: 0, height: 0)
    }
    
    
    
}

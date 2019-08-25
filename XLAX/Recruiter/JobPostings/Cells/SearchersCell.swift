//
//  TestSearchersCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/13/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class SearchersCell : UICollectionViewCell {
    let profileIcon : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholderImg")
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    let name = UILabel(text: "Steve Jobs", font: UIFont(name: "SFProRounded-Bold", size: 16)!)
    let location = UILabel(text: "Cupertino California", font: UIFont(name: "SFProRounded-Light", size: 16)!)
    let headline = UILabel(text: "UI/Designer, where ya ass was at dog when niggas didnt feed me, where ya ass was at dog when niggas didnt need me", font: UIFont(name: "SFProRounded-Light", size: 12)!, numberOfLines: 0)
    let experience = UILabel(text: "10 years", font: UIFont(name: "SFProRounded-Light", size: 12)!)
    let blackLine = UIView()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeView()
        setupStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeView() {
        backgroundColor = .white
    }
    
    func setupStack() {
        let nameAndLocation = HorizontalStackView(arrangedSubviews: [
            name,
            location,
            ], spacing: 12)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIView(),
            nameAndLocation,
            UIView()
            ], spacing: 6)
        
        addSubview(profileIcon)
        profileIcon.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0), size: CGSize(width: 60, height: 60))
        addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 85, bottom: 65, right: 0))
        
        addSubview(blackLine)
        blackLine.backgroundColor = .lightGray
        blackLine.anchor(top: stackView.bottomAnchor, leading: profileIcon.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 4), size: CGSize(width: 0, height: 0.4))
        addSubview(headline)
        headline.anchor(top: blackLine.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 12, bottom: 0, right: 12), size: CGSize(width: 0, height: 0))
        
        nameAndLocation.distribution = .fillEqually
        location.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
    }
}

//
//  SettingsCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 1/30/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(white: 0.5, alpha: 0.3) : UIColor.white
        }
    }
    
    var setting: Setting? {
        didSet {
            titleLabel.text = setting?.name.rawValue
            if let imageName = setting?.imageName {
                iconImage.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImage.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
            }
        }
    }
    
    //setting icon image
    
    let iconImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    //setting title label
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        addSubview(iconImage)
        iconImage.anchor(top: self.topAnchor, bottom: nil, right: nil, left: self.leftAnchor, paddingTop: 8, paddingBottom: -8, paddingRight: 0, paddingLeft: 8, height: 35, width: 35)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: iconImage.topAnchor, bottom: nil, right: nil, left: iconImage.rightAnchor, paddingTop: 10, paddingBottom: 0, paddingRight: 0, paddingLeft: 10, height: 0, width: 0)
    }
    
}



class Setting : NSObject {
    let name : SettingName
    let imageName : String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

//enumerations for settings

enum SettingName : String {
    case Profile = "Profile"
    case Feedback = "Feedback"
    case SignOut = "Sign Out"
}



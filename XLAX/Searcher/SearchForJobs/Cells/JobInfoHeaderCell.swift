//
//  JobInfoHeaderCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/7/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobInfoHeaderCell : UICollectionViewCell {
    
    //creates the job image view
    let jobImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(imageLiteralResourceName: "astronaut")
        return img
    }()
    
    //creates the location label for the view
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "12545 Riata Vista Cir, Austin, TX 78727"
        label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupElements()
    }
    
    //adds the jobs image to the view with constraints
    func setupJobImage() {
        addSubview(jobImage)
        jobImage.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 100, paddingBottom: 100, paddingRight: 100, paddingLeft: 100, height: 0, width: 0)
    }
    
    //add location label below the picture
    func setupLocationLabel() {
        addSubview(locationLabel)
        locationLabel.anchor(top: nil, bottom: bottomAnchor, right: nil, left: nil, paddingTop: 0, paddingBottom: -10, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
        locationLabel.centerXAnchor.constraint(equalTo: jobImage.centerXAnchor).isActive = true
    }
    
    
    
    func setupElements() {
        setupJobImage()
        setupLocationLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

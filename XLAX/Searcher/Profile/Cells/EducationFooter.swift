//
//  EducationFooter.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/29/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit



class EducationFooter : UICollectionViewCell {
    
    let addExperienceLabel = UILabel(text: "Add Education", font: .systemFont(ofSize: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupAddEducationButton()
    }
    
    func setupAddEducationButton() {
        addSubview(addExperienceLabel)
        addExperienceLabel.constrainHeight(constant: 35)
        addExperienceLabel.constrainWidth(constant: 100)
        addExperienceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addExperienceLabel.textColor = UIColor.rgb(red: 0, green: 122, blue: 235)
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

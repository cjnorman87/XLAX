//
//  SkillsInnerCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/17/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class SkillsInnerCell : UICollectionViewCell {
    
    let astronaut = UIImageView(image: UIImage(named: "astronaut"))
    let skill = UILabel(text: "Software Engineer", font: UIFont(name: "SFProRounded-Light", size: 12)!, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(skill)
        //skill.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        skill.centerInSuperview()
        skill.sizeToFit()
//        addSubview(astronaut)
//        astronaut.centerInSuperview()
//        astronaut.constrainWidth(constant: 100)
//        astronaut.constrainHeight(constant: 50)
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

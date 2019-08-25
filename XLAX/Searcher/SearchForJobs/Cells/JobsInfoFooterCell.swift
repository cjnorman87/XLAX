//
//  JobsInfoFooterCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/7/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobsInfoFooterCell : UICollectionViewCell {
    
    //creates apply button
    lazy var applyButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.setTitle("Apply", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(applyToJob), for: .touchDown)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupApplyButton()
    }
    
    //add apply button to view with contraints
    func setupApplyButton() {
        addSubview(applyButton)
        applyButton.anchor(top: nil, bottom: bottomAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 0, paddingBottom: 15, paddingRight: 25, paddingLeft: 25, height: 50, width: 0)
        applyButton.layer.cornerRadius = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //function used for the user to apply to a job
    @objc func applyToJob() {
        print("apply to this job")
    }
}

//
//  JobPostingCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/8/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class JobPostingsCell : UICollectionViewCell {
    
    let storyIcon : UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        return view
    }()
    
    let jobTitle = UILabel(text: "Job", font: UIFont(name: "SFProRounded-Light", size: 12)!)
    let jobType = UILabel(text: "Type", font: UIFont(name: "SFProRounded-Light", size: 12)!)
    let location = UILabel(text: "Location", font: UIFont(name: "SFProRounded-Light", size: 12)!)
    let salary = UILabel(text: "Salary", font: UIFont(name: "SFProRounded-Light", size: 12)!)
    
    let jobInfo = UILabel(text: "Software Engineer", font: UIFont(name: "SFProRounded-Bold", size: 12)!)
    let typeInfo = UILabel(text: "Full-Time", font: UIFont(name: "SFProRounded-Bold", size: 12)!)
    let locationInfo = UILabel(text: "Houston", font: UIFont(name: "SFProRounded-Bold", size: 12)!)
    let salaryInfo = UILabel(text: "$74k", font: UIFont(name: "SFProRounded-Bold", size: 12)!)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        let firstTitleSetStack = VerticalStackView(arrangedSubviews: [jobTitle,
                                                                      jobType,
                                                                      location,
                                                                      salary ], spacing: 4)
        
        let secondTitleSetStack = VerticalStackView(arrangedSubviews: [jobInfo,
                                                                       typeInfo,
                                                                       locationInfo,
                                                                       salaryInfo
            ], spacing: 4)
        
        let stackView = HorizontalStackView(arrangedSubviews: [
            firstTitleSetStack,
            UIView(),
            
            secondTitleSetStack,
            UIView()
            ], spacing: 16)
        addSubview(storyIcon)
        storyIcon.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 35, left: 20, bottom: 0, right: 0), size: CGSize(width: 60, height: 60))
        addSubview(stackView)
        stackView.alignment = .center
        stackView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0))
    }
}

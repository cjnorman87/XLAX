//
//  CandidateWorkExperienceInnerCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/17/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class CandidateWorkExperienceInnerCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    
    let title = UILabel(text: "Software Engineer", font: .systemFont(ofSize: 16), numberOfLines: 0)
    let name = UILabel(text: "JP MORGAN", font: .systemFont(ofSize: 12, weight: .ultraLight), numberOfLines: 1)
    let duration = UILabel(text: "March 2009 - February 2010", font: .systemFont(ofSize: 12, weight: .ultraLight), numberOfLines: 1)
    let summary = UILabel(text: "Oh lord tell me, do we get what we deserve. Do we get what we deserve. Oh way down, we go go go go go go go go go go go go go go", font: .systemFont(ofSize: 12, weight: .thin), numberOfLines: 0)
    let blankImageView = UIImageView(cornerRadius: 16)
    
    func setupStackView() {
        let stackView = VerticalStackView(arrangedSubviews: [
            title,
            UIStackView(arrangedSubviews: [
                name,
                ], customSpacing: 0),
            duration,
            summary,
            blankImageView
            ], spacing: 8)
        blankImageView.constrainHeight(constant: 5)
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

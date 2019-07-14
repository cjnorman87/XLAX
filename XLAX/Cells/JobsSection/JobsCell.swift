//
//  JobsCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 1/30/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

protocol JobsCellDelegate {
    func handleStoryTap()
}

class JobsCell : UICollectionViewCell {
    
    var delegate : JobsCellDelegate?
    
    //posting icon for jobs
    lazy var postingIcon : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "placeholderImg")
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.rgb(red: 136, green: 206, blue: 236).cgColor
        view.layer.borderWidth = 3
        return view
    }()
    
    //title of posting
    let postingTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.5, alpha: 0.8)
        label.text = "Programmer"
        return label
    }()
    
    //time of posting
    let latestTimePosting : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.5, alpha: 0.8)
        label.text = "2 hrs ago"
        return label
    }()
    
    //salary of job posting
    let salaryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25/hour"
        label.textColor = UIColor(white: 0.5, alpha: 0.5)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //type of job
    let jobType : UILabel = {
        let label = UILabel()
        label.text = "Full time"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.5, alpha: 0.5)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //set up job posting cell
    func setupCell() {
        backgroundColor = .white
        setupPostingIcon()
        setupPostingTitle()
        setupJobType()
        setupSalaryTitle()
        setupLatestTimePosting()
    }
    
    func setupPostingIcon() {
        addSubview(postingIcon)
        postingIcon.anchor(top: nil, bottom: nil, right: nil, left: leftAnchor, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 20, height: 60, width: 60)
        postingIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        postingIcon.isUserInteractionEnabled = true
        let storyTap = UITapGestureRecognizer(target: self, action: #selector(showStory))
        postingIcon.addGestureRecognizer(storyTap)

    }
    
    func setupPostingTitle() {
        addSubview(postingTitle)
        postingTitle.anchor(top: postingIcon.topAnchor, bottom: nil, right: nil, left: postingIcon.leftAnchor, paddingTop: 10, paddingBottom: 0, paddingRight: 0, paddingLeft: 75, height: 0, width: 0)
    }
    
    func setupJobType() {
        addSubview(jobType)
        jobType.anchor(top: postingTitle.topAnchor, bottom: nil, right: nil, left: postingTitle.leftAnchor, paddingTop: 15, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
    }
    
    func setupSalaryTitle() {
        addSubview(salaryLabel)
        salaryLabel.anchor(top: jobType.topAnchor, bottom: nil, right: nil, left: jobType.leftAnchor, paddingTop: 15, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
    }
    
    func setupLatestTimePosting() {
        addSubview(latestTimePosting)
        latestTimePosting.anchor(top: postingIcon.topAnchor, bottom: nil, right: rightAnchor, left: nil, paddingTop: 5, paddingBottom: 0, paddingRight: -5, paddingLeft: 0, height: 0, width: 0)

    }
    
    @objc func showStory() {
        delegate?.handleStoryTap()
    }

    
}

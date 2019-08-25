//
//  StoriesCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 2/24/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

protocol StoryCellDelegate {
    func handleStoryView()
}

class StoriesCell : UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var storyCellDelegate : StoryCellDelegate?
    
    //id for stories for specific job
    let storyCellID = "storyCellID"
    
    //collection view for specific job stories
    lazy var postsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    //title for story
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Stories"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPostsCollectionView()
        setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //set up collection view for stories cell
    func setupPostsCollectionView() {
        postsCollectionView.register(StoryCell.self , forCellWithReuseIdentifier: storyCellID)
        addSubview(postsCollectionView)
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
        postsCollectionView.showsHorizontalScrollIndicator = false
    }
    
    //set up title label constraints
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, bottom: nil, right: nil, left: leftAnchor, paddingTop: 1, paddingBottom: 4, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
        titleLabel.textColor = UIColor(white: 0.5, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellID, for: indexPath) as! StoryCell
        let images : [UIImage] = [#imageLiteral(resourceName: "galaxy"), #imageLiteral(resourceName: "Earth"), #imageLiteral(resourceName: "motherEarth"), #imageLiteral(resourceName: "astronaut"), #imageLiteral(resourceName: "planet")]
        cell.storyView.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        storyCellDelegate?.handleStoryView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
}

class StoryCell : UICollectionViewCell {
    
    var storyDelegate : StoryCellDelegate?
    
    //story icon
    let storyView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 4
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //set up the stories cell
    func setupCell() {
        addSubview(storyView)
        storyView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        storyView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        storyView.layer.cornerRadius = 70/2
        storyView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        storyView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        storyView.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(showStory))
//        storyView.addGestureRecognizer(tapGesture)
    }
}

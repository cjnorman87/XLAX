//
//  SegmentBar.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/13/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class SegmentBar : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    let segmentNames = ["Applied", "Saved"]
    var horizontalBarLeftConstraint : NSLayoutConstraint?
    var jobsController: JobsController?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupHorizontalBar()
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(SegmentCell.self, forCellWithReuseIdentifier: cellID)
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .bottom)
    }
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftConstraint = horizontalBarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        horizontalBarLeftConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SegmentCell
        cell.segmentTitle.text = segmentNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        jobsController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SegmentCell : UICollectionViewCell {
    
    let segmentTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(segmentTitle)
        segmentTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override var isHighlighted: Bool {
        didSet{
            segmentTitle.textColor = isHighlighted ? UIColor.rgb(red: 136, green: 206, blue: 235) : UIColor.lightGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            segmentTitle.textColor = isSelected ? UIColor.rgb(red: 136, green: 206, blue: 235) : UIColor.lightGray
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

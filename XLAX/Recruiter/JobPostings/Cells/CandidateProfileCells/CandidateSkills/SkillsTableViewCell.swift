//
//  SkillsTableViewCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/17/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class SkillsTableViewCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let skillsInnerCell = "skillsInnerCellID"
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellTitle : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.sizeToFit()
        title.text = "Skills"
        title.font = UIFont(name: "SFProRounded-Bold", size: 12)
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeview()
        setupCellTitleLabel()
        customizeCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeCollectionView() {
        addSubview(collectionView)
        collectionView.fillSuperview(padding: UIEdgeInsets(top: 25, left: 10, bottom: 10, right: 10))
        collectionView.register(SkillsInnerCell.self, forCellWithReuseIdentifier: skillsInnerCell)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.layer.cornerRadius = 20
    }
    
    func customizeview() {
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    func setupCellTitleLabel() {
        addSubview(cellTitle)
        cellTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: skillsInnerCell, for: indexPath) as! SkillsInnerCell
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 0.6
        cell.layer.borderColor = UIColor.rgb(red: 136, green: 206, blue: 235).cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let dummyCell = SkillsInnerCell(frame: CGRect(x: 0, y: 0, width: frame.width - 10 * 2, height: 1000))
        let dummyCell = SkillsInnerCell(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        dummyCell.layoutIfNeeded()

        //let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: frame.width - 10 * 2, height: 1000))
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: 100, height: 50))
        print("width : \(estimatedSize.width) + height : \(estimatedSize.height)")
        return CGSize(width: estimatedSize.width, height: estimatedSize.height)
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1000)
        self.collectionView.layoutIfNeeded()

        return CGSize(width: collectionView.contentSize.width, height: collectionView.contentSize.height + 100)
    }
    
}

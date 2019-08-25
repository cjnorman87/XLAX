//
//  CandidateWorkExperienceCell.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/17/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class CandidateWorkExperienceCell : UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let workExperienceID = "experienceCellInfoCellID"
    
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
        title.text = "Work Experience"
        title.font = .systemFont(ofSize: 16)
        return title
    }()
    
    let titleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "briefcase-1")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeCollectionView() {
        addSubview(collectionView)
        collectionView.fillSuperview(padding: UIEdgeInsets(top: 25, left: 10, bottom: 10, right: 10))
        collectionView.register(CandidateWorkExperienceInnerCell.self, forCellWithReuseIdentifier: workExperienceID)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: workExperienceID, for: indexPath) as! CandidateWorkExperienceInnerCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = CandidateWorkExperienceInnerCell(frame: CGRect(x: 0, y: 0, width: frame.width - 10 * 2, height: 1000))
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: frame.width - 10 * 2, height: 100))
        return CGSize(width: estimatedSize.width, height: estimatedSize.height)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1000)
        self.collectionView.layoutIfNeeded()
        
        return CGSize(width: collectionView.contentSize.width, height: collectionView.contentSize.height + 20)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeview()
        setupCellTitleLabel()
        customizeCollectionView()
    }
    
}

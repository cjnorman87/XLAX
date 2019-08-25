//
//  TestEducationCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 5/8/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

protocol EducationCellDelegate {
    func showEducationController()
}

class EducationCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: EducationCellDelegate?
    let educationFooter = "educationFooter"
    let educationCell = "educationCell"
    
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
        title.text = "Education"
        title.font = .systemFont(ofSize: 16)
        return title
    }()
    
    let titleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "education")?.withRenderingMode(.alwaysTemplate)
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
        collectionView.register(EducationInformationCell.self, forCellWithReuseIdentifier: educationCell)
        collectionView.register(EducationFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: educationFooter)
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
        cellTitle.anchor(top: topAnchor, leading: titleImage.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
    }
    
    func setupCellTitleImage() {
        addSubview(titleImage)
        titleImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), size: CGSize(width: 18, height: 18))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: educationCell, for: indexPath) as! EducationInformationCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: educationFooter, for: indexPath) as! EducationFooter
        footer.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(footerPressed))
        footer.addGestureRecognizer(tapGesture)
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = EducationInformationCell(frame: CGRect(x: 0, y: 0, width: frame.width - 10 * 2, height: 1000))
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: frame.width - 10 * 2, height: 100))
        return CGSize(width: estimatedSize.width, height: estimatedSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: frame.width - 10 * 2 , height: 75)
    }
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1000)
        self.collectionView.layoutIfNeeded()
        
        return CGSize(width: collectionView.contentSize.width, height: collectionView.contentSize.height)
    }
    
    @objc func footerPressed() {
        delegate?.showEducationController()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeview()
        setupCellTitleImage()
        setupCellTitleLabel()
        customizeCollectionView()
    }
    
}

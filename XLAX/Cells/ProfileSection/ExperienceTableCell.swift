//
//  ExperienceTableCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/31/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class ExperienceTableCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        collectionView.constrainHeight(constant: collectionView.contentSize.height)
        backgroundColor = .purple
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 100)
    }
    
}

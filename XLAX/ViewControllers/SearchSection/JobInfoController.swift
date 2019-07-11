//
//  JobInfoController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/6/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobInfoController : BaseListController, UICollectionViewDelegateFlowLayout{
    
    //identifier for collection view
    let cellID = "cellID"
    let headerID = "headerID"
    let footerID = "footerID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        registerCells()
        
    }
    
    func registerCells() {
        collectionView.register(JobsInfoGroupCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(JobInfoHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(JobsInfoFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    //set the settings for the cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! JobsInfoGroupCell
        return cell
        
    }
    
    //sets up header view for the cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! JobInfoHeaderCell
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! JobsInfoFooterCell
            return footer
        default:
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "empty", for: indexPath)
        }
    }
    
    //fixes the size for the header view
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    //fixes the size for the footer view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    //returns the number of cells for the collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //returns the number
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 300)
    }
    
    //spaces the header view from the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
}

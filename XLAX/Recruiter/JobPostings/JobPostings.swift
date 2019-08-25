//
//  JobPostings.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/8/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class JobPostings : BaseListController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavView()
        customizeCollectionView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! JobPostingsCell
        cell.layer.cornerRadius = 16
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20 * 2, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let jobSearchers = JobSearchers()
        navigationController?.pushViewController(jobSearchers, animated: true)
    }
    
    func customizeNavView() {
        navigationController?.navigationBar.topItem?.title = "Job Postings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func customizeCollectionView() {
        collectionView.register(JobPostingsCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
}

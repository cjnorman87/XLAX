//
//  AppliedController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/18/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class AppliedController : BaseListController, UICollectionViewDelegateFlowLayout, JobsCellDelegate {
    
    let jobsCellID = "jobsCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(JobsCell.self, forCellWithReuseIdentifier: jobsCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: jobsCellID, for: indexPath) as! JobsCell
        cell.delegate = self
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 105)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let jobsInfoVC = InfoController()
        navigationController?.pushViewController(jobsInfoVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func handleStoryTap() {
        let newView = StoryViewController()
        navigationController?.present(newView, animated: true, completion: nil)
    }
}

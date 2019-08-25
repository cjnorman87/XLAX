//
//  SavedController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/18/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class SavedController : BaseListController, UICollectionViewDelegateFlowLayout, StoryCellDelegate, JobsCellDelegate {
    
    let jobsCellID = "jobsCellID"
    let storiesCellID = "storiesCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(JobsCell.self, forCellWithReuseIdentifier: jobsCellID)
        collectionView.register(StoriesCell.self, forCellWithReuseIdentifier: storiesCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let storiesCell = collectionView.dequeueReusableCell(withReuseIdentifier: storiesCellID, for: indexPath) as! StoriesCell
            storiesCell.storyCellDelegate = self
            return storiesCell
        }
        let jobsCell = collectionView.dequeueReusableCell(withReuseIdentifier: jobsCellID, for: indexPath) as! JobsCell
        jobsCell.delegate = self
        return jobsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 150)
        }
        return CGSize(width: view.frame.width, height: 115)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let jobsInfoVC = InfoController()
        navigationController?.pushViewController(jobsInfoVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func handleStoryView() {
        let newView = StoryViewController()
        navigationController?.present(newView, animated: true, completion: nil)
    }
    
    func handleStoryTap() {
        let newView = StoryViewController()
        navigationController?.present(newView, animated: true, completion: nil)
    }
    
}

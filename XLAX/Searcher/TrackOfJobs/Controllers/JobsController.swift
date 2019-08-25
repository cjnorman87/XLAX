//
//  JobsController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/12/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobsController : BaseListController, UICollectionViewDelegateFlowLayout {
    
    let appliedControllerCellID = "appliedControllerCell"
    let savedControllerCellID = "savedControllerCell"
    
    lazy var segmentBar : SegmentBar = {
        let seg = SegmentBar()
        seg.jobsController = self
        return seg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSegmentBar()
    }
    
    
    func setupCollectionView() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: appliedControllerCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: savedControllerCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appliedControllerCellID, for: indexPath)
            let appliedVC = AppliedController()
            cell.addSubview(appliedVC.view)
            addChild(appliedVC)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: savedControllerCellID, for: indexPath)
            let savedVC = SavedController()
            cell.addSubview(savedVC.view)
            addChild(savedVC)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.height - 250
        return CGSize(width: view.frame.width, height: height)
    }
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        segmentBar.horizontalBarLeftConstraint?.constant = scrollView.contentOffset.x / 2
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        segmentBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    func setupSegmentBar() {
        view.addSubview(segmentBar)
        segmentBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: 50))
    }
    
    
}

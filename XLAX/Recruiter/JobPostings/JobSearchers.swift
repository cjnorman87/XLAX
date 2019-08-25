//
//  JobSearchers.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/10/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class JobSearchers : BaseListController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeCollectionView()
        customizeNavBar()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! SearchersCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchersProfile = SearchersProfile()
        navigationController?.present(searchersProfile, animated: true, completion: nil)
    }
    
    func customizeCollectionView() {
        collectionView.register(SearchersCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = .white
    }
    
    func customizeNavBar() {
        self.title = "Candidates"
        navigationItem.largeTitleDisplayMode = .never
    }
}

//
//  JobSearchController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 1/29/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class JobSearchController : BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UISearchControllerDelegate, UINavigationControllerDelegate, JobsCellDelegate {
  
    
    //collection view cell id
    let jobsCellID = "jobsCellID"
    
    //creates search controller object
    let searchController : UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultsController())
        controller.hidesNavigationBarDuringPresentation = false
        let bar = controller.searchBar
        bar.searchBarStyle = .minimal
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureSearchController()
    }
    
    //allows the navigation bar to appear after setting navigation bar to hidden in JobsInformation Controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    //configures search controller. sets color of navigation bar and creates behaviors for smooth transition of pushing view controller
    func configureSearchController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        
        navigationItem.titleView = searchController.searchBar
        navigationItem.searchController?.searchBar.sizeToFit()
        searchController.delegate = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
        customizeSearchBar()
    }
    
    //sets the search bar background to white
    func customizeSearchBar() {
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
    }
    
    // set up collection view for job searches, sets color for navigation controller, creates inset for collectionview spacing, removes navigation bar grey line
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        collectionView.register(JobsCell.self , forCellWithReuseIdentifier: jobsCellID)
    }
    
    
    //determinees number of cells returned
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    //characteristics of cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: jobsCellID, for: indexPath) as! JobsCell
        cell.delegate = self
        return cell
    }
    
    //controls size of collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 105)
    }
    
    //establishes which navigation controller to be pushed to 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let jobInfo = JobInfoController()
        navigationController?.pushViewController(jobInfo, animated: true)
    }
    
    func handleStoryTap() {
        let newView = StoryViewController()
        navigationController?.present(newView, animated: true, completion: nil)
    }
    
    
    
}

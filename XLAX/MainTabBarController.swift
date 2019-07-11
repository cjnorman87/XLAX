//
//  MainTabBarController.swift
//  XLAX
//
//  Created by Christopher Norman on 7/10/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        setupTabBar()
    }
    
    func setupTabBar() {
        viewControllers = [
            createNavBarController(viewController: JobSearchController(), unselectedImage: "search_unselected", selectedImage: "search_selected"),
            createNavBarController(viewController: JobsController(), unselectedImage: "like_unselected", selectedImage: "like_selected"),
            createNavBarController(viewController: TestProfile(), unselectedImage: "profile_unselected", selectedImage: "profile_selected")
        ]
    }
    
    func setupRecTabBar() {
        viewControllers = [
            createNavBarController(viewController: JobSearchController(), unselectedImage: "search_unselected", selectedImage: "search_selected"),
            createNavBarController(viewController: camController(), unselectedImage: "like_unselected", selectedImage: "like_selected"),
            createNavBarController(viewController: TestProfile(), unselectedImage: "profile_unselected", selectedImage: "profile_selected")
        ]
    }
    
    fileprivate func createNavBarController(viewController: UIViewController, unselectedImage: String, selectedImage: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: unselectedImage)
        navController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        return navController
    }
}

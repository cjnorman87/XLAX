//
//  StoryViewController.swift
//  
//
//  Created by Jacorey Brown on 3/19/19.
//

import UIKit

class StoryViewController : UIViewController {
    
    let dismissButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupDismissButton()
    }
    
    func setupDismissButton() {
        view.addSubview(dismissButton)
        dismissButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 30, left: 15, bottom: 0, right: 0), size: CGSize(width: 25, height: 25))
    }
    
    @objc func dismissScreen() {
        dismiss(animated: true, completion: nil)
    }
    
}

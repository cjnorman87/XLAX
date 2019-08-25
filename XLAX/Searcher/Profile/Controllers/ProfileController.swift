//
//  TestProfile.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 4/7/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit
import Firebase

class ProfileController : UITableViewController, EducationCellDelegate, ExperienceCellDelegate  {
    
    let userProfileImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "placeholderImg")
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 80
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Jacorey Brown"
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Austin, Tx"
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let locationIcon : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "location")?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var header : UIView = {
        let view = UIView()
        view.addSubview(userProfileImage)
        userProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userProfileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -45).isActive = true
        userProfileImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        userProfileImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        view.addSubview(nameLabel)
        nameLabel.anchor(top: userProfileImage.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 10, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
        nameLabel.centerXAnchor.constraint(equalTo: userProfileImage.centerXAnchor).isActive = true
        view.addSubview(locationLabel)
        locationLabel.anchor(top: nameLabel.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 8, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
        locationLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive  = true
        view.addSubview(locationIcon)
        locationIcon.anchor(top: locationLabel.topAnchor, bottom: nil, right: locationLabel.leftAnchor, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 5, paddingLeft: 0, height: 20, width: 20)
        return view
    }()
    
    lazy var experienceHeader : UIView = {
        let header = UIView()
        header.backgroundColor = .white
        let iconImage = UIImageView(image: UIImage(named: "briefcase")?.withRenderingMode(.alwaysTemplate))
        iconImage.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        header.addSubview(iconImage)
        iconImage.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 15, left: 8, bottom: 0, right: 0), size: CGSize(width: 15, height: 15))
        let label = UILabel(text: "Work Experience", font: .systemFont(ofSize: 16))
        header.addSubview(label)
        label.anchor(top: header.topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 15, left: 8, bottom: 0, right: 0))
        return header
    }()
    
    lazy var educationHeader : UIView = {
        let header = UIView()
        header.backgroundColor = .white
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationLine()
        customizeTableView()
        addSettingsButton()
    }
    
    func customizeTableView() {
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(ExperienceCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    func hideNavigationLine() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return header
        }
        return UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300 : 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = ExperienceCell(style: .default, reuseIdentifier: "cellID")
            cell.delegate = self
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.layer.cornerRadius = 8
            return cell
        } else {
            let cell = EducationCell(style: .default, reuseIdentifier: "cell")
            cell.delegate = self
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.layer.cornerRadius = 8
            return cell
        }
    }
    
    func showEducationController() {
        let controller = EditEducationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showExperienceController() {
        let controller = EditExperienceController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func addSettingsButton() {
        let gearImage = UIImage(named: "gear")?.withRenderingMode(.alwaysTemplate)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: gearImage, style: .plain, target: self, action: #selector(promptSettings))
        
    }
    
    @objc func promptSettings() {
        let alertController = UIAlertController(title: "Log out", message: "Are you sure?", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            do{
                try Auth.auth().signOut()
            } catch let signOutErr{
                print("Failed to sign out", signOutErr)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        alertController.addAction(UIAlertAction(title: "Create Job", style: .default, handler: { (_) in
            let createPostingController = CreateJobPostingController()
            createPostingController.modalTransitionStyle = .coverVertical
            self.present(createPostingController, animated: true, completion: nil)
            
        }))
        
        alertController.addAction(UIAlertAction(title: "info controller", style: .default, handler: { (_) in
            let infoController = InfoController()
            infoController.modalPresentationStyle = .formSheet
            self.present(infoController, animated: true, completion: nil)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
}

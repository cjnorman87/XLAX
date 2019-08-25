//
//  SearchersProfile.swift
//  XLAX
//
//  Created by Jacorey Brown on 8/14/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class SearchersProfile : UITableViewController {
  
    let userProfileImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "placeholderImg")
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 110/2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Steve Jobs"
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Cupertino, CA"
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
        userProfileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        userProfileImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        userProfileImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        view.addSubview(nameLabel)
        nameLabel.anchor(top: userProfileImage.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 10, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
        nameLabel.centerXAnchor.constraint(equalTo: userProfileImage.centerXAnchor).isActive = true
        view.addSubview(locationLabel)
        locationLabel.anchor(top: nameLabel.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 8, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
        locationLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive  = true
        view.addSubview(locationIcon)
        locationIcon.anchor(top: locationLabel.topAnchor, bottom: nil, right: locationLabel.leftAnchor, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 5, paddingLeft: 0, height: 20, width: 20)
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.topAnchor, bottom: nil, right: nil, left: view.leftAnchor, paddingTop: 6, paddingBottom: 0, paddingRight: 0, paddingLeft: 10, height: 0, width: 50)

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
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Cancel").withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTableView()
    }
    
    
    func customizeTableView() {
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(CandidateBasicInfoTVCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return header
        }
        return UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 250 : 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = CandidateBasicInfoTVCell(style: .default, reuseIdentifier: "cellID")
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.layer.cornerRadius = 8
            return cell
        } else if indexPath.section == 2 {
            let cell = CandidateWorkExperienceCell(style: .default, reuseIdentifier: "cell")
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.layer.cornerRadius = 8
            return cell
        } else if indexPath.section == 3 {
            let cell = SkillsTableViewCell(style: .default, reuseIdentifier: "cell")
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.layer.cornerRadius = 8
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.backgroundColor = .orange
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
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  ProfileCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/22/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class ProfileSummaryCell : UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    class HeaderLabel : UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    
    let titleLabel : UILabel = {
        let label = UILabel(text: "My Info", font: .systemFont(ofSize: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    lazy var tableView : UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.dataSource = self
        tb.delegate = self
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 16
        setupTitleLabel()
        setupTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.anchors(top: topAnchor, bottom: nil, right: nil, left: leftAnchor, paddingTop: 3, paddingBottom: 0, paddingRight: 0, paddingLeft: 5, height: 50, width: frame.width)
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        addSubview(tableView)
        tableView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderLabel()
        switch section {
        case 0:
            header.text = "First Name"
        case 1:
            header.text = "Last Name"
        case 2:
            header.text = "Phone"
        case 3:
            header.text = "Location"
        default:
            header.text = "Bio"
        }
        header.textColor = .darkGray
        return header
    }

func numberOfSections(in tableView: UITableView) -> Int {
    return 20
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ProfileSummaryTableViewCell(style: .default, reuseIdentifier: nil)
    switch indexPath.section {
    case 0:
        cell.textField.placeholder = "First Name"
    case 1:
        cell.textField.placeholder = "Last Name"
    case 2:
        cell.textField.placeholder = "Enter Your Phone Number"
        cell.textField.keyboardType = .numberPad
    case 3:
        cell.textField.placeholder = "Location"
    default:
        cell.textField.placeholder = ""
    }
    return cell
}
}



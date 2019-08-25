//
//  CreateJobPosting.swift
//  XLAX
//
//  Created by Jacorey Brown on 7/21/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit
import Eureka

class CreateJobPostingController : FormViewController {
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Cancel").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return button
    }()
    
    let submitButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let titleLabel = UILabel(text: "Create Job Posting", font: UIFont(name: "roboto-bold", size: 22)!)
    
    let border = UIView()
    
    var salaryOptions = ["None"]
    var jobTypeOptions = ["Full-Time", "Part-Time", "Contract"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupCancelButton()
        setupNavTitle()
        
        form +++
            Section()
            <<< TextRow() {
                $0.placeholder = "Job Title"
                $0.titlePercentage = 0.2
                $0.placeholderColor = .gray
                }.cellUpdate({ (cell, row) in
                    cell.textField.textColor = .gray
                }).cellSetup({ (cell, row) in
                })
            
            <<< TextRow() {
                $0.placeholder = "Location"
                $0.titlePercentage = 0.2
                $0.placeholderColor = .gray
                }.cellUpdate({ (cell, row) in
                    cell.textField.textColor = .gray
                })
            
            <<< PickerInlineRow<String>() {
                $0.title = "Job Type"
                $0.noValueDisplayText = "Type"
                $0.options = jobTypeOptions
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .gray
                })
            
            <<< PickerInlineRow<String>() {
                $0.noValueDisplayText = "None"
                $0.title = "Salary"
                for i in stride(from: 20, through: 100, by: 5) {
                    salaryOptions.append("$\(i),000 / year")
                }
                for i in stride(from: 100, to: 200, by: 25) {
                    salaryOptions.append("$\(i),000 / year")
                }
                salaryOptions.append("$200,000+ / year")
                $0.options = salaryOptions
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .gray
                })

        form +++
            Section()
            <<< TextAreaRow() {
                $0.placeholder = "Who we are?"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 60)
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .gray
                    cell.textView.textColor = .gray
                    cell.placeholderLabel?.textColor = .gray
                }).cellSetup({ (cell, row) in
                })

            <<< TextAreaRow() {
                $0.placeholder = "What will you do?"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 60)
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .gray
                    cell.textView.textColor = .gray
                    cell.placeholderLabel?.textColor = .gray
                })
            <<< TextAreaRow() {
                $0.placeholder = "Team Fun Fact"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 60)
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .gray
                    cell.textView.textColor = .gray
                    cell.placeholderLabel?.textColor = .gray
                })
        
            <<< ButtonRow() {
                $0.title = "Submit"
                $0.onCellSelection({ (cell, row) in
                    self.submitButtonIsTapped()
                })
                }.cellUpdate({ (cell, row) in
                    cell.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
                    cell.textLabel?.textColor = .white
                    cell.layer.cornerRadius = 12
                })
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupCancelButton() {
        tableView.addSubview(cancelButton)
        cancelButton.anchor(top: tableView.topAnchor, bottom: nil, right: nil, left: view.leftAnchor, paddingTop: -45, paddingBottom: 0, paddingRight: 0, paddingLeft: 20, height: 0, width: 50)
    }
    
    func setupController() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        tableView.frame = CGRect(x: 20, y: (self.tableView.frame.origin.y), width: (self.tableView.frame.width) - 40, height: self.tableView.frame.height)
        tableView.separatorStyle = .singleLine
    }
    
    func setupNavTitle() {
        tableView.addSubview(titleLabel)
        titleLabel.anchor(top: tableView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: -15, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 0))
        titleLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        titleLabel.textColor = .darkGray
    }
    
    @objc func dismissController() {
        dismiss(animated: true, completion: nil)
    }
    
    func submitButtonIsTapped() {
        print("submit button is tapped")
    }
    
    func upload(completion: @escaping ((Error?) -> Void) = { _ in }) {
        
    }
    
}

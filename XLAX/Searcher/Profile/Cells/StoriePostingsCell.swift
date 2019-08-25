//
//  StoriesCell.swift
//  XLAX
//
//  Created by Christopher Norman on 7/12/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class StoriePostingsCell: UITableViewCell {
    class StoriesTextField: UITextField {
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 24, dy: 0)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 24, dy: 0)
        }
        
        override var intrinsicContentSize: CGSize {
            return .init(width: 0, height: 44)
        }
    }
    
    let submitBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create A New Story", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 169, green: 169, blue: 248)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handlePost), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let textField: UITextField = {
        let tf = StoriesTextField()
        tf.placeholder = "Enter Name"
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textField)
        textField.fillSuperview()
        
        addSubview(submitBtn)
        submitBtn.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    @objc func handlePost() {
        print("Handling Post")
    }
}

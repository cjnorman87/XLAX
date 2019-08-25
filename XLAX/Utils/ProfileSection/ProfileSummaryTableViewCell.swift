//
//  ProfileSummaryTableViewCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/23/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class ProfileSummaryTableViewCell : UITableViewCell {
    
    class Field: UITextField {
        
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
    
    let textField : UITextField = {
       let tf = Field()
        tf.placeholder = "Enter Your Name"
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textField)
        textField.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

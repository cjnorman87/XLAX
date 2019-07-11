//
//  CustomCheckCell.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 6/3/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit
import Eureka

open class CustomCheckCell: Cell<Bool>, CellType {
    
    required public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy public var trueImage : UIImage = {
        return (UIImage(named: "selected")?.withRenderingMode(.alwaysTemplate))!
    }()
    
    
    lazy public var falseImage : UIImage = {
        return (UIImage(named: "unselected")?.withRenderingMode(.alwaysTemplate))!
    }()
    
    open var checkImageView : UIImageView? {
        guard accessoryType == .checkmark else {
            return self.imageView
        }
        
        guard let accessoryView = accessoryView else {
            let imageView = UIImageView()
            imageView.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
            self.accessoryView = imageView
            return imageView
        }
        
        return accessoryView as? UIImageView
        
    }
    
    open override func update() {
        super.update()
        checkImageView?.image = row.value == true ? trueImage.withRenderingMode(.alwaysTemplate) : falseImage.withRenderingMode(.alwaysTemplate)
        checkImageView?.sizeToFit()
        editingAccessoryType = accessoryType
        selectionStyle = .default
        if row.isDisabled {
            tintAdjustmentMode = .dimmed
            selectionStyle = .none
        } else {
            tintAdjustmentMode = .automatic
        }
    }
    
    open override func setup() {
        super.setup()
        accessoryType = .checkmark
        editingAccessoryType = accessoryType
    }
    
    open override func didSelect() {
        row.value = row.value ?? false ? false : true
        row.deselect()
        row.updateCell()
    }
    
}

// MARK: CheckRow
open class _CustomCheckRow: Row<CustomCheckCell> {
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

///// Boolean row that has a checkmark as accessoryType
public final class CustomCheckRow: _CustomCheckRow, RowType {
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }
}



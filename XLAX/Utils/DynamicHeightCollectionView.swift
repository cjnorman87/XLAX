//
//  DynamicHeightCollectionView.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 4/6/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView : UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if __CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
}

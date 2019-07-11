//
//  BaseListController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/6/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class BaseListController : UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

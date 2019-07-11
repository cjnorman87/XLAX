//
//  User.swift
//  XLAX
//
//  Created by Christopher Norman on 7/10/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import Foundation

struct User {
    
    let uid: String
    let username: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"]  as? String ?? ""
    }
}

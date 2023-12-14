//
//  User.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import Foundation

struct User {
    var id = UUID()
    let username: String
    let profileImageUrl: String
    
    init(id: UUID = UUID(), username: String, profileImageUrl: String) {
        self.id = id
        self.username = username
        self.profileImageUrl = profileImageUrl
    }
}

//
//  UserViewModel.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import Foundation

class UserViewModel: ObservableObject {
    let shared = UserViewModel()
    init(){}
    
    @Published var currentUser: User?
    
    init(currentUser: User? = nil) {
        self.currentUser = User(username: "테스트", profileImageUrl: "")
    }
}

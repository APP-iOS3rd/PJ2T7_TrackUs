//
//  UserViewModel.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import Foundation

class UserViewModel: ObservableObject {
    static let shared = UserViewModel()
    private init(){}
    
    @Published var currentUser: User = User(username: "테스트", profileImageUrl: "")
}

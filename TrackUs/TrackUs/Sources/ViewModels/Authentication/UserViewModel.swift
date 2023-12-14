//
//  UserViewModel.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import Foundation

// 인스턴스가 1개이상 생성이 안됨 싱글톤
class UserViewModel: ObservableObject {
    static let shared = UserViewModel()
    private init(){}
    
    @Published var currentUser: User = User(username: "테스트", profileImageUrl: "")
}

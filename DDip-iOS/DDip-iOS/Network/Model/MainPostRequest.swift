//
//  MainPostRequest.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

struct MainPostRequest: Codable {
    var userId: Int
    var postId: Int
    
    init(_ userId: Int, _ postId: Int) {
        self.userId = userId
        self.postId = postId
    }
}

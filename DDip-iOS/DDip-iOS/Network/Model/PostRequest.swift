//
//  PostRequest.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

struct PostRequest: Codable {
    var postId: Int
    
    init(_ postId: Int) {
        self.postId = postId
    }
}

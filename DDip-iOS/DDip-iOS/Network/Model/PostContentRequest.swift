//
//  PostContentRequest.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

struct PostContentRequest: Codable {
    var userId: Int
    var title: String
    var hashtagLocation: String
    var hashtagTime: String
    var maxCount: Int
    var description: String
    var imageUrl: String
    
    init(_ userId: Int,_ title: String,_ hashtagLocation: String,_ hashtagTime: String, _ maxCount: Int,_ description: String,_ imageUrl: String ) {
        self.userId = userId
        self.title = title
        self.hashtagLocation = hashtagLocation
        self.hashtagTime = hashtagTime
        self.maxCount = maxCount
        self.description = description
        self.imageUrl = imageUrl
    }
}

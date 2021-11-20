//
//  MainPostResponse.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

// MARK: - MainPostResponse
struct MainPostResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DDipClass?
}

// MARK: - DataClass
struct DDipClass: Codable {
    let ddip: Ddip
}

// MARK: - Ddip
struct Ddip: Codable {
    let id, postID, userID: Int
    let createdAt, updatedAt: String
    let isDeleted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case postID = "postId"
        case userID = "userId"
        case createdAt, updatedAt, isDeleted
    }
}

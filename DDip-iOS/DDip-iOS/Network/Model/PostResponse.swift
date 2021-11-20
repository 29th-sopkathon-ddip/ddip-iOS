//
//  PostResponse.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

// MARK: - PostResponse
struct PostResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: PostData
}

// MARK: - DataClass
struct PostData: Codable {
    let post: Post
    let dippedUser: [DippedUser]
}

// MARK: - DippedUser
struct DippedUser: Codable {
    let id: Int
    let name, createdAt, updatedAt: String
    let isDeleted: Bool
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    let title, hashtagLocation, hashtagTime: String
    let maxCount: Int
    let imageURL, createdAt, updatedAt: String
    let isDeleted: Bool
    let postDescription: String
    let userID: Int
    let userName: String

    enum CodingKeys: String, CodingKey {
        case id, title, hashtagLocation, hashtagTime, maxCount
        case imageURL = "imageUrl"
        case createdAt, updatedAt, isDeleted
        case postDescription = "description"
        case userID = "userId"
        case userName
    }
}

//
//  PostContentResponse.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

// MARK: - PostContentResponse
struct PostContentResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: PostContent
}

// MARK: - DataClass
struct PostContent: Codable {
    let id: Int
    let title, hashtagLocation, hashtagTime: String
    let maxCount: Int
    let imageURL, createdAt, updatedAt: String
    let isDeleted: Bool
    let dataDescription: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, title, hashtagLocation, hashtagTime, maxCount
        case imageURL = "imageUrl"
        case createdAt, updatedAt, isDeleted
        case dataDescription = "description"
        case userID = "userId"
    }
}

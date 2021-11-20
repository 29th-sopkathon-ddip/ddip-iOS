//
//  MainResponse.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

// MARK: - MainResponse
struct MainResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let id: Int
    let title, hashtagLocation, hashtagTime: String
    let maxCount: Int
    let imageURL: String
    let createdAt, updatedAt: String
    let isDeleted: Bool
    let cardDescription: String
    let userID, currentCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, hashtagLocation, hashtagTime, maxCount
        case imageURL = "imageUrl"
        case createdAt, updatedAt, isDeleted
        case cardDescription = "description"
        case userID = "userId"
        case currentCount
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, createdAt, updatedAt: String
    let isDeleted: Bool
}

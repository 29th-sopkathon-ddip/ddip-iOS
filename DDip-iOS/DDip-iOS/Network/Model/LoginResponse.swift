//
//  LoginResponse.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginIdData?
}

// MARK: - DataClass
struct LoginIdData: Codable {
    let user: UserIdData
}

// MARK: - User
struct UserIdData: Codable {
    let id: Int
    let name, createdAt, updatedAt: String
    let isDeleted: Bool
}

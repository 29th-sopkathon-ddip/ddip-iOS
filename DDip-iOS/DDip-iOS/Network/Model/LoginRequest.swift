//
//  LoginRequest.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

struct LoginRequest: Codable {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

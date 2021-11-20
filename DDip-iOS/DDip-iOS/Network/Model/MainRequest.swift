//
//  MainRequest.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Foundation

struct MainRequest: Codable {
    var userId: Int
    
    init(_ userId: Int) {
        self.userId = userId
    }
}

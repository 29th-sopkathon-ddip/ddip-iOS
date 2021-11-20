//
//  Login.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

class Login: NSObject {
    
    static let shared = Login()
    
    // MARK: - LOGIN
    
    func setLogin(nickname: String, userId: Int) {
        let def = UserDefaults.standard
        UserData.set(nickname, forKey: .userName)
        UserData.set(userId, forKey: .userId)
        
        def.synchronize()
    }
    
    func setLoginOut() {
        let def = UserDefaults.standard
        
        UserData<Any>.clearAll()
        
        def.synchronize()
    }
}


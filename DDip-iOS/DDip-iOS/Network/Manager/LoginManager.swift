//
//  LoginManager.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Moya

final class LoginManager {
    
    // MARK: - Static Properties
    
    static let shared: LoginManager = LoginManager()
    
    // MARK: - Network Properties
    
    private let authProvider = MoyaProvider<LoginService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private var model: LoginResponse?
    
    func dispatchLogin(nickname: String, completion: @escaping (() -> ())) {
        let param = LoginRequest.init(nickname)
        
        authProvider.request(.login(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.model = try result.map(LoginResponse.self)
                    
                    Login.shared.setLogin(nickname: nickname, userId: self.model?.data?.user.id ?? 0)
                    
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                    completion()
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion()
            }
        }
    }
}



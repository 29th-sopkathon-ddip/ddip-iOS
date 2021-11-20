//
//  MainManager.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Moya

final class MainManager {
    
    // MARK: - Static Properties
    
    static let shared: MainManager = MainManager()
    
    // MARK: - Network Properties
    
    private let authProvider = MoyaProvider<MainService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private var model: MainResponse?
    
    // MARK: - Properties
    
    public private(set) var lists: [Card] = []
    
    // MARK: - POST /setting/nickname
    
    func fetchMain(completion: @escaping (() -> ())) {
        let param = MainRequest.init(UserDefaultStorage.userId)
        
        authProvider.request(.main(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.model = try result.map(MainResponse.self)
                    
                    self.model?.data.cards.forEach {
                        self.lists.append($0)
                    }
                    
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


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
    private var postModel: MainPostResponse?
    private var contentModel: PostResponse?
    private var makeModel: PostContentResponse?
    
    // MARK: - Properties
    
    public private(set) var lists: [Card] = []
    public private(set) var contents: [Ddip] = []
    public private(set) var content: Post?
    public private(set) var dipperUsers: [DippedUser] = []
    
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
    
    func dispatchMain(postId: Int, completion: @escaping (() -> ())) {
        let param = MainPostRequest.init(UserDefaultStorage.userId, postId)
        
        print(param)
        authProvider.request(.detailMain(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.postModel = try result.map(MainPostResponse.self)
                    
                    guard let ddip = self.postModel?.data?.ddip else { return }
                    
                    self.contents.append(ddip)
                    
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
    
    func fetchPost(postId: Int, completion: @escaping (() -> ())) {
        let param = PostRequest.init(postId)
        
        authProvider.request(.detailPost(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.makeModel = try result.map(PostContentResponse.self)
                    
                    self.content = self.contentModel?.data.post
                    
                    self.contentModel?.data.dippedUser.forEach {
                        self.dipperUsers.append($0)
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
    
    func dispatchPost(_ userId: Int,_ title: String,_ hashtagLocation: String,_ hashtagTime: String, _ maxCount: Int,_ description: String,_ imageUrl: String, completion: @escaping (() -> ())) {
        let param = PostContentRequest.init(userId, title, hashtagLocation, hashtagTime, maxCount, description, imageUrl)
        
        authProvider.request(.post(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.postModel = try result.map(MainPostResponse.self)
                    
                    print(self.postModel)
                    
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


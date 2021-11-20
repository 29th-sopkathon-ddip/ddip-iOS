//
//  MainService.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Moya

enum MainService {
    case main(param: MainRequest)
    case detailMain(param: MainPostRequest)
    case detailPost(param: PostRequest)
    case post(param: PostContentRequest)
}

extension MainService: TargetType {
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .main,
             .detailMain:
            return "/main"
        case .detailPost,
             .post:
            return "/post"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .main,
             .detailPost:
            return .get
        case .detailMain,
             .post:
            return .post
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .main(let param):
            return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
        case .detailMain(let param):
            return .requestJSONEncodable(param)
        case .detailPost(let param):
            return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
        case .post(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}


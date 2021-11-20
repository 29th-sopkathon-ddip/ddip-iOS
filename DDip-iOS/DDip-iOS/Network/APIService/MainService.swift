//
//  MainService.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import Moya

enum MainService {
    case main(param: MainRequest)
}

extension MainService: TargetType {
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .main:
            return "/main"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .main:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .main(let param):
            return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}


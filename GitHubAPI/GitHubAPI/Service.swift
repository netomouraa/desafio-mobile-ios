//
//  Service.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import Alamofire


enum Router: URLRequestConvertible {
    case repositories(parameters: Parameters)
    case pulls(repo: String, parameters: Parameters)
    
    static let baseURLString = "https://api.github.com"
    
    var method: HTTPMethod {
        switch self {
        case .repositories:
            return .get
        case .pulls:
            return .get
       
        }
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "/search/repositories"
        case .pulls(let repo, _):
            return "/repos/\(repo)/pulls"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .repositories(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .pulls( _, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}



//enum Router: URLRequestConvertible {
//
//    static let baseURL = "https://api.github.com"
//
//    case repositories([String: Any])
//    case pulls//([String: Any])
//
//    func asURLRequest() throws -> URLRequest {
//        var method: HTTPMethod {
//        switch self {
//        default:
//            return .get
//        }
//    }
//
//    let params: ([String: Any]?) = {
//        switch self {
//        case .repositories(let params):
//            return params
//        case .pulls(let params):
//            return params
//        }
//     }()
//
//        let url: URL = {
//            let relativePath: String?
//            switch self {
//                case .repositories:
//                    relativePath = "/search/repositories"
//            case .pulls(owner: Int, repo: Int):
//                    relativePath = "/repos/\(owner)/\(repo)/pulls"
//            }
//
//            var url = URL(string: Router.baseURL)!
//            if let relativePath = relativePath {
//                url = url.appendingPathComponent(relativePath)
//            }
//            return url
//        }()
//
//    var urlRequest = URLRequest(url: url)
//    urlRequest.httpMethod = method.rawValue
//
//        switch self {
//        case .repositories(let parameters):
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
//        case .pulls(let parameters):
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
//        default:
//            break
//        }
//        return urlRequest
//
//    }
//
//}


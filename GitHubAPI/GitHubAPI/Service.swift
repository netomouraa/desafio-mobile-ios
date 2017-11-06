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
    
    static let baseURL = "https://api.github.com"
    
    case search([String: Any])
    case list([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
        
    let params: ([String: Any]?) = {
        switch self {
        case .search(let params):
            return params
        case .list(let params):
            return params
        }
     }()
        
        let url: URL = {
            let relativePath: String?
            switch self {
                case .search:
                    relativePath = "/search/repositories"
                case .list:
                    relativePath = "/repos"
            }
    
            var url = URL(string: Router.baseURL)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue

        switch self {
        case .search(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        return urlRequest
        
    }
    
}


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

//
//  PullRequest.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequests: Mappable{
    var title: String?
    var body: String?
    var url: String?
    var updated_at: String?
    var user: RepositorieOwner?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        url <- map["html_url"]
        updated_at <- map["updated_at"]
        user <- map["user"]
    }
}

//
//  Repositorie.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositorie: Mappable{
    var id: Int?
    var name: String?
    var full_name: String?
    var description: String?
    var owner: RepositorieOwner?
    var forks_count: Int?
    var stargazers_count: Int?
    var open_issues_count: Int?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        full_name <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
        forks_count <- map["forks_count"]
        stargazers_count <- map["stargazers_count"]
        open_issues_count <- map["open_issues_count"]

    }
}

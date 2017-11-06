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
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        full_name <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
    }
}

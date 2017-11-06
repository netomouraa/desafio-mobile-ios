//
//  RepositorieOwner.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositorieOwner: Mappable{
    var login: String?
    var avatarURL: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        avatarURL <- map["avatar_url"]
    }
}

//
//  Repositories.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Repositories: Mappable{
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Repositorie]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        total_count <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
}

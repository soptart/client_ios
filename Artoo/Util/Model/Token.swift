//
//  Token.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import ObjectMapper

struct Token: Mappable {
    
    var token: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        token <- map["token"]
    }
}

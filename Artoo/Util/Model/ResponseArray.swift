//
//  ResponseArray.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import ObjectMapper

struct ResponseArray<T: Mappable>: Mappable {
    
    var status: Int?
    var message: String?
    var data: [T]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}

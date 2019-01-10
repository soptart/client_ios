//
//  MyArt.swift
//  Artoo
//
//  Created by 보윤 on 10/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

//회원 작품 조회
struct MyArt : Mappable{
    
    var u_description: String?
    var data: [MyArt]?
    var dataNum: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        u_description <- map["u_description"]
        data <- map["data"]
        dataNum <- map["dataNum"]
        
    }
    
    
}

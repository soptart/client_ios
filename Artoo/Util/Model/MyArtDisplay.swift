//
//  MyArtDisplay.swift
//  Artoo
//
//  Created by 보윤 on 10/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

//회원전시신청하는지 조회
struct MyArtDisplay : Mappable{
    
    var a_idx: Int?
    var a_url: String?
    var a_isDisplay: Bool?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        a_idx <- map["a_idx"]
        a_url <- map["a_url"]
        a_isDisplay <- map["a_isDisplay"]
        
    }
}

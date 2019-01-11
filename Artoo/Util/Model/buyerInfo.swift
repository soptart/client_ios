//
//  buyerInfo.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

struct buyerInfo : Mappable {
    
    var p_isPost: Bool?
    var p_recipient: String?
    var p_address: String?
    var p_phone: String?
    var p_payment: Int?
    var p_currentTime: Date?
    var p_comment: String?
    var a_idx: Int?
    var p_sellerIdx: Int?
    var p_buyerIdx: Int?
    var p_price: Int?
    var p_state: Int?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        p_isPost <- map["p_isPost"]
        p_recipient <- map["p_recipient"]
        p_address <- map["p_address"]
        p_phone <- map["p_phone"]
        p_payment <- map["p_payment"]
        p_currentTime <- map["p_currentTime"]
        p_comment <- map["p_comment"]
        a_idx <- map["a_idx"]
        p_sellerIdx <- map["p_sellerIdx"]
        p_buyerIdx <- map["p_buyerIdx"]
        p_price <- map["p_price"]
        p_state <- map["p_state"]
    }
    
    
    
}

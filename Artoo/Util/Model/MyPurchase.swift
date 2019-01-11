//
//  MyPurchase.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 11..
//  Copyright © 2019년 홍정민. All rights reserved.
//// 마이페이지 거래 내역 조회



import Foundation
import ObjectMapper

struct MyPurchase : Mappable {
    
    var pIndex:Int?
    var aIndex:Int?
    var aName:String?
    var uName:String?
    var aPrice:Int?
    var state:Int?
    var aPicUrl:String?
    var pDate:String?
    var buyer:Bool?
    
    init?(map: Map) {
        
    }


    mutating func mapping(map: Map) {
        pIndex <- map["p_idx"]
        aIndex <- map["a_idx"]
        aName <- map["a_name"]
        uName <- map["u_name"]
        aPrice <- map["a_price"]
        state <- map["p_state"]
        aPicUrl <- map["a_pic_url"]
        pDate <- map["p_date"]
        buyer <- map["buyer"]

        
    }
    
    
    
}

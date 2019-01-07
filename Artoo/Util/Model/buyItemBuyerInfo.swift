//
//  buyItemBuyerInfo.swift
//  Artoo
//
//  Created by 보윤 on 07/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

//구매하기 버튼 누른 다음의 응답 바디(필요한지는 의문)
struct buyItemBuyerInfo: Mappable{
    
    var artName: String? //작품이름
    var authorSchool: String? //작가학교
    var authorName: String? // 작가이름
    var artPrice: Int? //작품 가격
    var deliveryFee: Int? //배송비
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        artName <- map["artworkName"]
        authorSchool <- map["artistSchool"]
         authorName <- map["artistName"]
         artPrice <- map["artworkPrice"]
         deliveryFee <- map["deliveryCharge"]
        
    }
    
    
}

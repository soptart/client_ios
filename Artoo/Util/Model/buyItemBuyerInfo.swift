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
    
    var artworkName: String? //작품이름
    var artistSchool: String? //작가학교
    var artistName: String? // 작가이름
    var artworkPrice: Int? //작품 가격
    var deliveryCharge: Int? //배송비
    var purchaseState: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        artworkName <- map["artworkName"]
        artistSchool <- map["artistSchool"]
         artistName <- map["artistName"]
         artworkPrice <- map["artworkPrice"]
         deliveryCharge <- map["deliveryCharge"]
        purchaseState <- map["purchaseState"]
    }
    
    
}

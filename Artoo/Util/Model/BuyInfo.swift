//
//  buyInfo.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//// 구매 내역을 위한 모델

import Foundation
import ObjectMapper

struct BuyInfo : Mappable {
    //전시 신청 정보
    var pInfo: Int? //구매 인덱스
    var pIsPay:Int? //구매 상태 0 -> 결제 전 / 1 -> 결제완료
    var pIsDelivery:Int? //구매 방법 0 -> 직거래 / 1 -> 택배
    var pDate:String? //구매 날짜
    var pIsComment:Bool? //후기 작성 가능 여부 (false여야 후기 작성 가능)
    var aIndex:Int? //작품 인덱스
    var aName:String? //작품명
    var auName:String? //작가 이름
    var aPrice:Int? //작품 가격
    var aPicUrl:String? // 사진 URL
    
    ////여기서부터 판매자 정보 아투로 고정값
    var uName:String? //판매자 이름
    var uPhone:String?
    var uAdress:String?
    var uBank:String?
    var uAccount:String?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        pInfo <- map["p_idx"]
        pIsPay <- map["p_isPay"]
        pIsDelivery <- map["p_isDelivery"]
        pDate <- map["p_date"]
        pIsComment <- map["c_isComment"]
        aIndex <- map["a_idx"]
        aName <- map["a_name"]
        auName <- map["a_u_name"]
        aPrice <- map["a_price"]
        aPicUrl <- map["a_pic_url"]
        uName <- map["u_name"]
        uPhone <- map["u_phone"]
        uAdress <- map["u_address"]
        uBank <- map["u_bank"]
        uAccount <- map["u_account"]
    }
    
}

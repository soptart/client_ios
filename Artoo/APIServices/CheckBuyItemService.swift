//
//  CheckBuyItem.swift
//  Artoo
//
//  Created by 보윤 on 07/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct CheckBuyItemService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<buyerInfo>
    static let shared = CheckBuyItemService()
    let checkBuyItemUrl = url("/artworks/")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //구매하기 버튼 눌렀을 때 구매자의 정보
    func buy(art_index: Int, user_index: Int, delivery: Bool, buyerName: String, buyerAddress: String,
             buyerPhone: String, Payment: Int?, completion: @escaping(NetworkData) -> Void) {
        
    
        
        let body = delivery ?  [
            "p_isPost" : true,
            "p_recipient" : buyerName,
            "p_address" : buyerAddress,
            "p_phone" : buyerPhone,
            "p_payment" : Payment
            ]:[
                
                "p_isPost" : false,
                "p_payment" : Payment
        ]
        
        
        postable(checkBuyItemUrl+"\(art_index)"+"/purchase/"+"\(user_index)", body: body, header: header) { res in
            switch res {
            case .success(let value):
                completion(value)
                print("success")
            case .error(let value):
                completion(value)
                print("fail")
            }
            
        }
        
    }
}

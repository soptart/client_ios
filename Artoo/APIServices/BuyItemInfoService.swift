//
//  BuyItemInfoService.swift
//  Artoo
//
//  Created by 보윤 on 11/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

//구매버튼 누른 뒤 작품 조회
struct BuyItemInfoService: APIManager, Requestable{
    
    typealias NetworkData = ResponseObject<buyItemBuyerInfo>
    static let shared = BuyItemInfoService()
    let checkBuyItemInfoURL = url("/artworks/")
    let header = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    func buyItemInfo(art_index: Int, completion: @escaping (NetworkData) -> Void){
        
        gettable(checkBuyItemInfoURL+"\(art_index)" + "/purchases", body: nil, header: header) {
            res in
            switch res {
            case .success(let value):
                print("success")
                completion(value)
            case .error(let error):
                print("fail")
                completion(error)
            }
            
            
            
        }
        
    }
}

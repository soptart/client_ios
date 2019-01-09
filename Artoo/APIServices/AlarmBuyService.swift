//
//  AlarmPurchaseService.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 9..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct AlarmBuyService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<BuyInfo>
    static let shared = AlarmBuyService()
    let buyURL = url("/notices/buys/")
    
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
    
    func getBuyList(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(buyURL+"\(user_idx)", body: nil, header: header) {
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

////
////  AlarmPurchaseService.swift
////  Artoo
////
////  Created by 홍정민 on 2019. 1. 9..
////  Copyright © 2019년 홍정민. All rights reserved.
////
//
//import Foundation
//struct AlarmPurchaseService: APIManager, Requestable {
//    typealias NetworkData = ResponseArray<Comments>
//    static let shared = AlarmPurchaseService()
//    let purchaseURL = url("/notices/buys/{user_idx}")
//    
//    let header: HTTPHeaders = [
//        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
//    
//    func delete(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
//        
//        gettable(purchaseURL+"\(user_idx)", body: nil, header: header) {
//            res in
//            switch res {
//            case .success(let value):
//                print("success")
//                completion(value)
//            case .error(let error):
//                print("fail")
//                completion(error)
//                
//            }
//            
//        }
//    }
//    
//}

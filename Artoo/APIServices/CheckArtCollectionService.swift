//
//  CheckArtCollectionService.swift
//  Artoo
//
//  Created by 보윤 on 10/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct CheckArtCollectionService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<MyArt>
    static let shared = CheckArtCollectionService()
    let myArtCollectionURL = url("/users/")
    let hearder : HTTPHeaders = [
    "Content-Type" : "application/json",
    "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    //회원의 작품 조회
    func artDescription(user_index: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(myArtCollectionURL+"\(user_index)", body: nil, header: nil) {
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

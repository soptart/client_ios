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
    
    typealias NetworkData = ResponseObject<ArtWork>
    static let shared = CheckBuyItemService()
    let checkBuyItemUrl = url("/artworks/")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"]
    
    
    //작품 클릭 시 작품 세부 설명
    func artDescription(art_index: Int, user_index: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(checkBuyItemUrl+"\(art_index)" + "/description" + "\(user_index)" , body: nil, header: header) {
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

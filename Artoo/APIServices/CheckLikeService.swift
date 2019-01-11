//
//  CheckLikeService.swift
//  Artoo
//
//  Created by 보윤 on 10/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct CheckLikeService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<ArtWork>
    static let shared = CheckLikeService()
    let artDescriptionURL = url("/artworks/")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
        ]
    
    
    //좋아요 누르면 
    func like(art_index: Int, user_index: Int, completion: @escaping (NetworkData) -> Void) {
        
        postable(artDescriptionURL+"\(art_index)" +
    "/likes/" + "\(user_index)", body: nil, header: header) {
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

//
//  UserDescriptionService.swift
//  Artoo
//
//  Created by 보윤 on 05/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Alamofire

struct UserDescriptionService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = UserDescriptionService()
    let userDescriptionURL = url("/users/{u_idx}/description")
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    

    func UserDescription(u_description: String, completion: @escaping(NetworkData) -> Void) {

        let body = [
            "u_description" : u_description
        ]
        
        puttable(userDescriptionURL, body: body, header: headers) { res in
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
    


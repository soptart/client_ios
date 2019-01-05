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
    

    func UserDescription(completion: @escaping(NetworkData) -> Void) {

        
        postable(userDescriptionURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):
                //                guard let status =  value.status else { return }
                //                guard let token = value.data?.token else { return }
                completion(value)
                print("success")
            case .error(let value):
                //                guard let status =  value.status else { return }
                completion(value)
                print("fail")
            }
            
        }
        
    }
    
}
    


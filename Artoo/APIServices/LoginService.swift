//
//  LoginService.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//


import Alamofire

struct LoginService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = LoginService()
    let loginURL = url("/login")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    
    
    //로그인 api
    func login(email: String, password: String, completion: @escaping(NetworkData) -> Void) {
        
        let body = [
            "u_email" : email,
            "u_pw" : password
        ]
        
        
        postable(loginURL, body: body, header: headers) { res in
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

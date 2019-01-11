//
//  EditUserInfoService.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 12..
//  Copyright © 2019년 홍정민. All rights reserved.
//



////회원 정보 수정

import Foundation
import Alamofire

struct EditUserInfoService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = EditUserInfoService()
    let editURL = url("/users/")
    
    let header: HTTPHeaders = [
        "Content-Type": "Application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //내 소개 변경
    func editMyDescription(user_idx: Int, u_description:String, completion: @escaping (NetworkData) -> Void) {
        let body = [
            "u_description" : u_description
        ]
        
        puttable(editURL+"\(user_idx)"+"/myInfo", body: body, header: header) {
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


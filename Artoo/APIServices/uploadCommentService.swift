//
//  uploadCommentService.swift
//  Artoo
//
//  Created by 보윤 on 07/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct uploadCommentService: APIManager, Requestable{
    
   
    typealias NetworkData = ResponseArray<Token>
    static let shared = uploadCommentService()
    let commentURL = url("/comments")
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    //댓글 작성 api
    func comment(comment: String, comment_Index: Int, art_Index: Int, completion: @escaping(Int) -> Void ){
        
        
        postable(commentURL, body: nil, header: header) { res in
            switch res {
            case .success(let value):
                guard let status =  value.status else { return }
                completion(status)
                print("success")
            case .error(let value):
                guard let status =  value.status else { return }
                completion(status)
                print("fail")
            }
            
        }
    }
    
    
}

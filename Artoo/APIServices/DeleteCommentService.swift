//
//  DeleteCommentService.swift
//  Artoo
//
//  Created by 보윤 on 09/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire


struct DeleteCommentService: APIManager, Requestable {
    typealias NetworkData = ResponseObject<Comments>
    static let shared = DeleteCommentService   ()
    let deleteCommentsURL = url("/comments/")
    let header: HTTPHeaders = [
        "Content-Type" : "Application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
    
    func delete(comment_index: Int, completion: @escaping (NetworkData) -> Void) {
        
       delettable(deleteCommentsURL+"\(comment_index)", body: nil, header: header) {
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

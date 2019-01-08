//
//  CheckCommentsService.swift
//  Artoo
//
//  Created by 보윤 on 08/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct CheckCommentsService: APIManager, Requestable{
    
    typealias NetworkData = ResponseArray<Comments>
    static let shared = CheckCommentsService()
    let checkCommentsURL = url("/comments/")
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
    
    //댓글 조회 기능
    func comments(art_index: Int, completion: @escaping (NetworkData) -> Void){

        gettable(checkCommentsURL+"\(art_index)", body: nil, header: header) {
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

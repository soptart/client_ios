//
//  CheckartWorks.swift
//  Artoo
//
//  Created by 보윤 on 05/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct CheckartWorksService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<Token>
    static let shared = CheckartWorksService()
    let artCheckURL = url("/artworks")
    let headers: HTTPHeaders = ["Content-Type" : "application/json"]
    
    //모든 작품 조회하는 api
    func check(artIndex: Int, artName: String, artWidth: Int, artHeight: Int, artDepth: Int, artCategory: String, artForm: String, artPrice: Int, artLikeCount: Int, userIndex: Int, artDetail: String, artDate: Date, artYear: String, pictureUrl: MultipartFormData, artTags: String, artLicense: String, completion: @escaping(Int) -> Void){
        
        postable(artCheckURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):
                guard let status =  value.status else { return }
                completion(status) //성공하면 success를 띄워라
                print("success")
            case .error(let value):
                guard let status =  value.status else { return }
                completion(status) //실패하면 fail띄우기.
                print("fail")
            }
            
        }
        
    }
    
}

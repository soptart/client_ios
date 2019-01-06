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
    typealias NetworkData = ResponseArray<ArtImage>
    static let shared = CheckartWorksService()
    let artCheckURL = url("/artworksmini")
    
    //모든 작품 조회하는 api
        func check(completion: @escaping(NetworkData) -> Void){
            gettable(artCheckURL, body: nil, header: nil) { res in
            switch res {
            case .success(let value):
                completion(value) //성공하면 success를 띄워라
                print("success")
            case .error(let value):
                completion(value) //실패하면 fail띄우기.
                print("fail")

                }
            
            }
        
        }
    }


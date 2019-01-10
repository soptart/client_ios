//
//  ArtDescriptionService.swift
//  Artoo
//
//  Created by 보윤 on 06/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct ArtDescriptionService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<ArtWork>
    static let shared = ArtDescriptionService()
    let artDescriptionURL = url("/artworks/")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"]
    
    
    //작품 클릭 시 작품 세부 설명
    func artDescription(art_index: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(artDescriptionURL+"\(art_index)", body: nil, header: header) {
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
    
    //좋아요 버튼 눌렀을 때
    func heart(art_index: Int, completion: @escaping (NetworkData) -> Void){
        
        postable(artDescriptionURL+"\(art_index)" + "/likes", body: nil, header: header) {
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

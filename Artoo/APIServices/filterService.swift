//
//  filterService.swift
//  Artoo
//
//  Created by 보윤 on 08/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct filterService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<ArtImage>
    static let shared = filterService()
    let filterURL = url("/artworks/")
    
    
    
    //구매하기 버튼 눌렀을 때 구매자의 정보
    func filter(artSize: String, artForm: String, artCategory: String, artKeyword: String?, completion: @escaping(NetworkData) -> Void) {
        let filteredURL = filterURL+"filter?a_size=\(artSize)" + "&a_form=\(artForm)" + "&a_category=\(artCategory)" + "&a_keyword=\(artKeyword ?? "")"
        guard let convertURL = filteredURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettable(convertURL, param: nil, header: nil) { res in
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

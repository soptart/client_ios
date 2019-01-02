//
//  HomeThemeService.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 2..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import Alamofire

struct HomeThemeService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<Theme>
    static let shared = HomeThemeService()
    let themeURL = url("/themes")
    
    
    //오늘의 작품 조희 API
    func today(completion: @escaping (NetworkData) -> Void) {
        gettable(themeURL, body: nil, header: nil) { res in
            switch res {
            case .success(let value):
                completion(value)
            case .error(let error):
                completion(error)
            }
        }
    }
    
    
}

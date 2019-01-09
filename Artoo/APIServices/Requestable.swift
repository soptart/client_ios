//
//  Requestable.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol Requestable {
    associatedtype NetworkData: Mappable
}



extension Requestable {
    
    //서버에 get 요청을 보내는 함수
    func gettable(_ url: String, body: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .get, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure:
                guard let value = res.result.value else { return }
                completion(.error(value))
            }
        }
        
    }
    
    //서버에 post 요청을 보내는 함수
    func postable(_ url: String, body: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure:
                guard let value = res.result.value else { return }
                completion(.error(value))
            }
        }
    }
    
    //서버에 put 요청을 보내는 함수
    func puttable(_ url: String, body: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .put, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure:
                guard let value = res.result.value else { return }
                completion(.error(value))
            }
        }
        
    }
    
    func delettable(_ url: String, body: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .delete, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure:
                guard let value = res.result.value else { return }
                completion(.error(value))
            }
        }
        
    }
    
    func gettable(_ url: String, param: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .get, parameters: param, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure:
                guard let value = res.result.value else { return }
                completion(.error(value))
            }
        }
        
    }
    
}

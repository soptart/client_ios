////회원 소개 서비스

import Foundation
import Alamofire

struct UserModifyService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<MyArt>
    static let shared = UserModifyService()
    let modifyURL = url("/users/")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //유저 정보 수정 함수
    func modifyUserInfo(user_idx: Int, u_description: String, completion: @escaping (NetworkData) -> Void) {
        
        let body = [
            "u_description" : u_description
        ]
        
        puttable(modifyURL+"\(user_idx)" + "/description", body: body, header: header) {
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


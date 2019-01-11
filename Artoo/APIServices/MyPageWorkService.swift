////회원 개인 작품 조회 서비스

import Foundation
import Alamofire

struct MyPageWorkService: APIManager, Requestable {
    
    typealias NetworkData = ResponseCustom<MyArtWork>
    static let shared = MyPageWorkService()
    let myWorkURL = url("/users/")
    
    
    
    
    //마이페이지 작품 가져오기
    func getMyPageWork(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        gettable(myWorkURL+"\(user_idx)", body: nil, header: nil) {
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




import Foundation
////회원 저장 작품 조회 서비스

import Foundation
import Alamofire

struct MyPageSaveService: APIManager, Requestable {
    
    typealias NetworkData = ResponseCustom<MyArtWork>
    static let shared = MyPageSaveService()
    let saveWorkURL = url("/users/")
    
    
    
    
    //마이페이지 작품 가져오기
    func getSaveWork(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        gettable(saveWorkURL+"\(user_idx)"+"/likes", body: nil, header: nil) {
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


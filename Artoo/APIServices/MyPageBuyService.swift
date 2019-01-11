

////회원 구매 내역 조회

import Foundation
import Alamofire

struct MyPageBuyService: APIManager, Requestable {
    
    typealias NetworkData = ResponseCustom<MyPurchase>
    static let shared = MyPageBuyService()
    let purchaseURL = url("/users/")
    
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]

    
    //마이페이지 구매 내역 가져오기
    func getBuyList(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        gettable(purchaseURL+"\(user_idx)"+"/purchases", body: nil, header: header) {
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


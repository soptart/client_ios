

////회원 리뷰 내역 조회

import Foundation
import Alamofire

struct MyPageReviewService: APIManager, Requestable {
    
    typealias NetworkData = ResponseCustom<MyReview>
    static let shared = MyPageReviewService()
    let reviewURL = url("/users/")
    
    
    
    //마이페이지 후기 내역 가져오기
    func getReviewList(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        gettable(reviewURL+"\(user_idx)"+"/reviews", body: nil, header: nil) {
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


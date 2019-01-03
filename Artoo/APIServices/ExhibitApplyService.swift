////전시 - 전시 신청서 서비스

import Foundation
import Alamofire

struct ExhibitApplyService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<ExhibitApply>
    static let shared = ExhibitApplyService()
    let applyURL = url("/discontents/application/")
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //전시 신청서 API
    func exhibitApply(user_idx: Int, completion: @escaping (NetworkData) -> Void) {

        gettable(applyURL+"\(user_idx)", body: nil, header: header) {
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


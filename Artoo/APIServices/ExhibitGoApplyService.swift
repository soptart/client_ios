////전시 신청 서비스


import Foundation
import Alamofire

struct ExhibitGoApplyService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<ExhibitGoApply>
    static let shared = ExhibitGoApplyService()
    let goApplyURL = url("/discontents/")
    let header: HTTPHeaders = [
        "Content-Type": "Application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //전시 신청 보내는 API
    func exhibitGoApply(art_idx: Int, display_idx:Int, user_idx:Int, completion: @escaping (NetworkData) -> Void) {
        
        let body = [
            "a_idx" : art_idx,
            "d_idx" : display_idx,
            "u_idx" : user_idx
        ]
   
        postable(goApplyURL+"\(user_idx)", body: body, header: header) {
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


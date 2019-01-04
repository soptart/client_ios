////전시 - 전시 관람 서비스

import Foundation
import Alamofire

struct ExhibitSeeService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<ExhibitSee>
    static let shared = ExhibitSeeService()
    let seeURL = url("/discontents/displays/")
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]
    
    
    //전시 보기 API
    func exhibitSee(display_idx: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(seeURL+"\(display_idx)", body: nil, header: header) {
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


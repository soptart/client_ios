

////전시 - 메인 서비스

import Foundation
import Alamofire

struct ExhibitMainService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<Exhibit>
    static let shared = ExhibitMainService()
    let exhibitURL = url("/displays")
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
    ]

    
    //전시 메인 API
    func exhibitMain(completion: @escaping (NetworkData) -> Void) {
        gettable(exhibitURL, body: nil, header: header) {
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

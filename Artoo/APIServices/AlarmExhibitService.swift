//// 전시 신청 내역 조회 서비스

import Foundation
import Alamofire

struct AlarmExhibitService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<ExhibitAlarm>
    static let shared = AlarmExhibitService()
    let exhibitURL = url("/notices/displays/users/")
    
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
    
    func getExhibitList(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(exhibitURL+"\(user_idx)", body: nil, header: header) {
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

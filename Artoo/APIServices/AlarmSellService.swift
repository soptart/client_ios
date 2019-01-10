//// 판매 내역 조회 서비스

import Foundation
import Alamofire

struct AlarmSellService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<BuyInfo>
    static let shared = AlarmSellService()
    let sellURL = url("/notices/sells/")
    
    let header: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi" ]
    
    func getSellList(user_idx: Int, completion: @escaping (NetworkData) -> Void) {
        
        gettable(sellURL+"\(user_idx)", body: nil, header: header) {
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

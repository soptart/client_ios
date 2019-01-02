
////테마 - 디테일 서비스

import Foundation
import Alamofire

struct ThemeDetailService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<ThemeDetail>
    static let shared = ThemeDetailService()
    let themeURL = url("/themes/details/")
    
    
    //테마 상세보기 조회API
    func themeDetail(index:Int, completion: @escaping (NetworkData) -> Void) {
        gettable(themeURL + "\(index)", body: nil, header: nil) { res in
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

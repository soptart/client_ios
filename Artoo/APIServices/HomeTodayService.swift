
// TODAY 화면 서버통신을 위한 함수

import Alamofire

struct HomeTodayService: APIManager, Requestable {
    
    typealias NetworkData = ResponseArray<Today>
    static let shared = HomeTodayService()
    let todayURL = url("/today")

    
    //오늘의 작품 조희 API
    func today(completion: @escaping (NetworkData) -> Void) {
        gettable(todayURL, body: nil, header: nil) { res in
            switch res {
            case .success(let value):
                completion(value)
            case .error(let error):
                completion(error)
            }
        }
    }
    
    
}

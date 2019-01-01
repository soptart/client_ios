
// TODAY 화면 서버통신을 위한 함수

import Alamofire

struct HomeTodayService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = HomeTodayVC()
    let loginURL = url("/login")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //로그인 api
    func login(email: String, password: String, completion: @escaping (Token) -> Void) {
        let body = [
            "email" : email,
            "password" : password,
            ]
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                guard let token = value.data else {return}
                completion(token)
            case .error(let error):
                print(error)
            }
        }
        
    }
    
}

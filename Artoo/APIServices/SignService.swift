
// 회원가입 서비스

import Alamofire

struct SignService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = SignService()
    let signURL = url("/users")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    
    
    //회원가입 api
    func sign(email: String, password: String,
              name: String, phone: String, adress: String,
              bank: String, account: String, school: String, dept: String, completion: @escaping(Int) -> Void) {
        
        let body = [
            "u_email" : email,
            "u_pw" : password,
            "u_name" : name,
            "u_phone" : phone,
            "u_address" : adress,
            "u_bank" : bank,
            "u_account" : account,
            "u_school" : school,
            "u_dept" : dept
        ]
        
        
        postable(signURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                guard let status =  value.status else { return }
                completion(status)
            case .error(let value):
                guard let status =  value.status else { return }
                completion(status)            }
            
        }
        
    }
    
}

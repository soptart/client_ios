
import ObjectMapper

struct ResponseCustom<T: Mappable>: Mappable {
    
    var status: Int?
    var message: String?
    var u_name:String?
    var u_description:String?
    var data: [T]?
    var dataNum:Int?

    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        u_name <- map["u_name"]
        u_description <- map["u_description"]
        data <- map["data"]
        dataNum <- map["message"]
    }
}

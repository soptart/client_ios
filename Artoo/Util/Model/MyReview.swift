
//// 마이페이지 후기 내역 조회



import Foundation
import ObjectMapper

struct MyReview : Mappable {
    
    
    var pIndex:Int?
    var aName:String?
    var uName:String?
    var pComment:String?
    var pDate:String?
    var aPicURL:String?

    
    init?(map: Map) {
        
    }
    
    
    mutating func mapping(map: Map) {
    
        pIndex <- map["p_idx"]
        aName <- map["a_name"]
        uName <- map["u_name"]
        pComment <- map["p_comment"]
        pDate <- map["p_date"]
        aPicURL <- map["a_pic_url"]
        
        
    }
    
    
    
}

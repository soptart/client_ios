
//// 전시 신청 서버에 보내는 모델

import Foundation
import ObjectMapper

struct ExhibitGoApply : Mappable {
    

    var displayIndex:Int?
    var displayTitle:String?
    var displaySubTitle:String?
    var userIndex:Int?
    var userName:String?
    var artIndex:Int?
    var artName:String?
    var enrollDate:String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
   
        displayIndex <- map["d_idx"]
        displayTitle <- map["d_title"]
        displaySubTitle <- map["d_subTitle"]
        userIndex <- map["u_idx"]
        userName <- map["u_name"]
        artIndex <- map["a_idx"]
        artName <- map["a_name"]
        enrollDate <- map["dc_date"]

    }
    
    
    
}

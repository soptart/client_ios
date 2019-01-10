
//// 전시 신청 서버에 보내는 모델

import Foundation
import ObjectMapper

struct ExhibitAlarm : Mappable {
    
    var display:Exhibit?
    var aIdx:Int?
    var aName:String?
    var uIdx:Int?
    var uName:String?
    var state:Int?
    var dcIdx:Int?
    var dcDate:String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        display <- map["display"] //전시 정보
        aIdx <- map["a_idx"]
        aName <- map["a_name"]
        
        //신청 유저 정보
        uIdx <- map["u_idx"]
        uName <- map["u_name"]
        state <- map["state"]
        
        //신청 취소 클릭시 넘겨 줌
        dcIdx <- map["dc_idx"]
        dcDate <- map["dc_date"]
    }
    
    
    
}

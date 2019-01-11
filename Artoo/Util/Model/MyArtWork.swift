
//// 마이페이지 작품 조회 - 세부 작품

import Foundation
import ObjectMapper

struct MyArtWork : Mappable {
    
    var aIndex:Int?
    var aUrl:String?
    var aIsDisplay:Bool?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        aIndex <- map["a_idx"]
        aUrl <- map["a_url"]
        aIsDisplay <- map["a_isDisplay"]
        
    }
    
    
    
}

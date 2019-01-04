
////전시 관람 모델

import Foundation
import ObjectMapper

struct ExhibitSee : Mappable {
    
    var displayIndex:Int?
    var displayTitle:String?
    var artIndex:Int?
    var artName:String?
    var artWidth:Int?
    var artHeight:Int?
    var artDepth:Int?
    var artForm:String?
    var artYear:String?
    var artImg:String?
    var userIndex:Int?
    var userName:String?
    

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        displayIndex <- map["d_idx"]
        displayTitle <- map["d_title"]
        artIndex <- map["a_idx"]
        artName <- map["a_name"]
        artWidth <- map["a_width"]
        artHeight <- map["a_height"]
        artDepth <- map["a_depth"]
        artForm <- map["a_form"]
        artYear <- map["a_year"]
        artImg <- map["pic_url"]
        userIndex <- map["u_idx"]
        userName <- map["u_name"]
        
        
        
    }
    
    
    
}


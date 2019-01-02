//// 홈 - 테마 세부모델

import Foundation
import ObjectMapper

struct ThemeWork : Mappable {
    var workIndex:Int?
    var workImg:String?
    
    init(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        workIndex <- map["a_idx"]
        workImg <- map["pic_url"]
    }
    
}

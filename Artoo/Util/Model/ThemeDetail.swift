
//// 테마 - 디테일 모델

import Foundation
import ObjectMapper

struct ThemeDetail : Mappable {
    var themeIndex:Int?
    var themeDetailImg:String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        themeIndex <- map["a_idx"]
        themeDetailImg <- map["pic_url"]
    }
}

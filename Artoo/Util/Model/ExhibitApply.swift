
//// 전시 신청 모델

import Foundation
import ObjectMapper

struct ExhibitApply : Mappable {
    
    var displayInfo:[Exhibit]?
    var artWorkInfo:[ArtWork]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        displayInfo <- map["displays"]
        artWorkInfo <- map["artworks"]
    }
    
    
    
}

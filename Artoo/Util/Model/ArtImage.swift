//
//  ArtImage.swift
//  Artoo
//
//  Created by 보윤 on 06/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

struct ArtImage : Mappable {
    var artIndex:Int?
    var artImg:String?
    
    init(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        artIndex <- map["a_idx"]
        artImg <- map["pic_url"]
    }
    
}

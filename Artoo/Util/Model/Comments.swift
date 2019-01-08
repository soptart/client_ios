//
//  Comments.swift
//  Artoo
//
//  Created by 보윤 on 08/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import ObjectMapper

struct comments: Mappable {
    
    var commentsText: String? //댓글내용
    var commentsDate: String? //댓글 날짜
    var commentsName: String? //댓글작성자
    var commentIndex: Int? //댓글 고유 인덱스
    var artIndex: Int? //작품 인덱스
    var userIndex: Int? // 사용자 인덱스
    var commentsAuth: Bool? //권한 체크
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        commentIndex <- map["c_idx"]
        commentsText <- map["c_content"]
        commentsDate <- map["c_date"]
        userIndex <- map["u_idx"]
        artIndex <- map["a_idx"]
        commentsAuth <- map["auth"]
        commentsName <- map["u_name"]
        
        
    }
    
    
   
    
    
}

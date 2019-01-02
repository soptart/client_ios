//  Work.swift
//  Artoo
//// 홈 - 투데이, 작가 선택 시 아래 컬렉션 모델

import Foundation
import ObjectMapper


struct TodayWork : Mappable {
    var workIndex: Int?
    var workName:String?
    var workMakeYear:String?
    var workImg:String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        workIndex <- map["a_idx"]
        workName <- map["a_name"]
        workMakeYear <- map["a_year"]
        workImg <- map["pic_url"]
    }
}

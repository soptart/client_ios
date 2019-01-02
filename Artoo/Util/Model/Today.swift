//  Author.swift
//  Artoo
//// 홈 - 투데이 모델


import Foundation
import ObjectMapper

struct Today : Mappable {
    var authorIndex: Int?
    var authorName:String?
    var authorIntro:String?
    var authorWork:[TodayWork]?
    
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        authorIndex <- map["u_idx"]
        authorName <- map["u_name"]
        authorIntro <- map["u_description"]
        authorWork <- map["list"]
    }
}
 

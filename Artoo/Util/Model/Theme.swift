//
//  Theme.swift
//  Artoo
//// 홈 - 테마 모델


import Foundation
import ObjectMapper

struct Theme : Mappable {

    var tagIndex:Int?
    var tagName:String?
    var mainTag:String?
    var subTag:String?
    var themeImg:String?
    var themeWork:[ThemeWork]?
    

    
    init(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        tagIndex <- map["t_idx"]
        tagName <- map["t_shortTag"]
        mainTag <- map["t_mainTag"]
        subTag <- map["t_subTag"]
        themeImg <- map["t_imgUrl"]
        themeWork <- map["list"]

    }
}

//
//  Exhibit.swift
//  Artoo
//
//// 전시 모델

import Foundation
import ObjectMapper

struct Exhibit : Mappable {
    //전시 신청 정보
    var exhibitIndex: Int? //전시장 인덱스 -> 첫화면
    var startDate:Date? //전시 시작 날짜
    var endDate:Date? //전시 마지막 날짜
    var applyStartDate:Date? //전시 신청 시작 날짜
    var applyEndDate:Date? //전시 신청 마지막 날짜
    var exhibitImg:String? //전시 대표 이미지 -> 첫화면
    var exhibitTitleImg:String? //텍스트 이미지
    var exhibitMainImg:String? //이미지
    var exhibitTitle:String? //전시 타이틀
    var exhibitSubTitle:String? //전시 부타이틀
    var exhibitEnterText:String? //전시 입장시 나타나는 글
    var exhibitApplyText:String? //전시 신청시 나타나는 글
    var isNowExhibit:Int? //전시중인지 신청중인지를 나타내는 변수 -> 첫화면
    

    
    init?(map: Map) {
     
    }
    
    mutating func mapping(map: Map) {
        exhibitIndex <- map["d_idx"]
        startDate <- map["d_sdateNow"]
        endDate <- map["d_edateNow"]
        
        applyStartDate <- map["d_sdateApply"]
        applyEndDate <- map["d_sdateApply"]
        
        exhibitImg <- map["d_repimg_url"]
        exhibitTitleImg <- map["d_titleImg_url"]
        exhibitMainImg <- map["d_mainImg_url"]
        exhibitTitle <- map["d_title"]
        exhibitSubTitle <- map["d_subTitle"]
        exhibitEnterText <- map["d_longDetail"]
        exhibitApplyText <- map["d_shortDetail"]
        isNowExhibit <- map["isNow"]
    }

}

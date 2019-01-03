//전시신청 -> 업로드에 사용
//내 작품에 대한 정보들을 담고 있음


import Foundation
import ObjectMapper

struct ArtWork : Mappable {
    
    //17개
    var artIndex:Int? //작품 인덱스 -> 전시신청서에서 사용
    var artName:String? //작품 이름
    var artWidth:Int? //작품 width
    var artHeight:Int? //작품 height
    var artDepth:Int? //작품 depth
    var artCategory:Int? //작품 카테고리
    var artForm:Int? //작품 형태
    var price:Int? //작품 가격
    var likeCount:Int? //작품 좋아요 수
    var userIndex:Int? //유저 인덱스
    var workDetail:String? //작품 상세 설명
    var artDate:Date? //작품 날짜
    var artYear:String? //작품 년도
    var artImg:String? //작품 이미지 -> 전시신청서에서 사용
    var auth:Bool? //머하는거지
    var artTag:String? //태그
    var artLicense:String? //라이센스

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        artIndex <- map["a_idx"]
        artName <- map["a_name"]
        artWidth <- map["a_width"]
        artHeight <- map["a_height"]
        artDepth <- map["a_depth"]
        artCategory <- map["a_category"]
        artForm <- map["a_form"]
        price <- map["a_price"]
        likeCount <- map["a_like_count"]
        userIndex <- map["u_idx"]
        workDetail <- map["a_detail"]
        artDate <- map["a_date"]
        artYear <- map["a_year"]
        artImg <- map["pic_url"]
        auth <- map["auth"]
        artTag <- map["a_tag"]
        artLicense <- map["a_license"]

    }
    
}


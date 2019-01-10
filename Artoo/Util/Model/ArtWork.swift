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
    var price:Int? //작품 가격
    var likeCount:Int? //작품 좋아요 수
    var userIndex:Int? //유저 인덱스
    var workDetail:String? //작품 상세 설명
    var artDate:Date? //작품 날짜
    var artYear:String? //작품 년도
    var artImg:String? //작품 이미지 -> 전시신청서에서 사용
    var auth:Bool? //작품 올린 당사자 -> true
    var artLicense:String? //라이센스
    var artSize: Int? // 작품 사이즈
    var artActive: Bool? // 사용할 필용 없음.
    var artExpression: String? //작품 표현기법
    var artPurchaseState: Int? //작품 구매상태
    var userName: String? //작가 이름
    var userSchool: String? //작가 학교
    var artIsLike: Bool? //좋아요 여부
    
    
    

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        artIndex <- map["a_idx"]
        artName <- map["a_name"]
        artWidth <- map["a_width"]
        artHeight <- map["a_height"]
        artDepth <- map["a_depth"]
        price <- map["a_price"]
        likeCount <- map["a_like_count"]
        userIndex <- map["u_idx"]
        workDetail <- map["a_detail"]
        artDate <- map["a_date"]
        artYear <- map["a_year"]
        artImg <- map["pic_url"]
        auth <- map["auth"]
        artLicense <- map["a_license"]
        artSize <- map["a_size"]
        artActive <- map["a_active"]
        artExpression <- map["a_expression"]
        artPurchaseState <- map["a_purchaseState"]
        userName <- map["u_name"]
        userSchool <- map["u_school"]
        artIsLike <- map["islike"]

    }
    
}


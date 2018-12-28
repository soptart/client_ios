//
//  ExhibitDetailInfo.swift
//  Artoo
//
//// 전시 신청 - 전시에 관한 디테일한 정보

import Foundation

struct ExhibitDetailInfo {
    //테이블뷰에 나오는 메인, 서브 텍스트
    let mainTxt:String
    let subTxt:String
    
    //전시기간
    let exhibitDate:String
    
    //신청기간
    let applyDate:String
    
    //작품 수
    let workNum:String
    
    //선발 인원
    let personNum:String
    
}

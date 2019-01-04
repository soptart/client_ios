//  AuthorWorkCell.swift
//  Artoo
////작가의 작품 셀


import UIKit

class TodayWorkCell: UICollectionViewCell {
    @IBOutlet weak var workImg: UIImageView!

    //작가 이름
    @IBOutlet weak var authorName: UILabel!
    
    //학교 이름
    @IBOutlet weak var schoolLabel: UILabel!
    
    //작가 소개
    @IBOutlet weak var authorIntro: UILabel!
    
    //-- 이미지
    @IBOutlet weak var img: UIImageView!
    
    //화살표 이미지
    @IBOutlet weak var arrowImg: UIImageView!
    
    
}

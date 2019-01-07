//
//  ExhibitCell.swift
//  Artoo
//

//// 전시 메인 테이블뷰 셀

import UIKit

class ExhibitCell: UITableViewCell {
    //메인 이미지
    @IBOutlet weak var exhibitImg: UIImageView!
    
    //메인 라벨 ex) 익숙함이 새로웠던 전
    @IBOutlet weak var exhibitMainLabel: UILabel!
    
    //서브 라벨 ex) 자유편
    @IBOutlet weak var exhibitSubLabel: UILabel!
    @IBOutlet weak var exhibitDetailLabel: UILabel!
    
}

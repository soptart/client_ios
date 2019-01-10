//
//  SellThirdCell.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 9..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SellThirdCell: UITableViewCell {

    //작품 이미지
    @IBOutlet weak var artImgView: UIImageView!
    
    //날짜 텍스트
    @IBOutlet weak var dateLabel: UILabel!
    
    //작품명
    @IBOutlet weak var workNameLabel: UILabel!
    
    //작가 이름
    @IBOutlet weak var authorNameLabel: UILabel!
    
    //배송 방식
    @IBOutlet weak var typeLabel: UILabel!
    
    //금액
    @IBOutlet weak var moneyLabel: UILabel!
    
    //계좌정보
    @IBOutlet weak var accountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

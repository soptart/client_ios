//
//  sellFirstCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class sellFirstCell: UITableViewCell {

    
    //날짜
    @IBOutlet weak var dateLabel: UILabel!
    
    //작품 이미지
    @IBOutlet weak var sellImg: UIImageView!
    
    //작품 이름
    @IBOutlet weak var buyItem: UILabel!
    
    //작가 이름
    @IBOutlet weak var buyItemAuthor: UILabel!
    
    //배송 방식
    @IBOutlet weak var transaction: UILabel!
    
 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

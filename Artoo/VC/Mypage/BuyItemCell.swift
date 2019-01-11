//
//  BuyItemCell.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class BuyItemCell: UITableViewCell {

    @IBOutlet weak var buyImg: UIImageView!
    @IBOutlet weak var isBuyerLabel: UILabel!
    
    @IBOutlet weak var artImg: UIImageView!
    @IBOutlet weak var artItem: UILabel! //작품이름
    @IBOutlet weak var buyer: UILabel! //구매자
    @IBOutlet weak var price: UILabel! //가격
    @IBOutlet weak var date: UILabel! //날짜
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

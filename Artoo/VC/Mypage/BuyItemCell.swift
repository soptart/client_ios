//
//  BuyItemCell.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class BuyItemCell: UITableViewCell {

    @IBOutlet weak var artImg: UIImageView!
    @IBOutlet weak var artItem: UILabel!
    @IBOutlet weak var buyer: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

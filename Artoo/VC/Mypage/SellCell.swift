//
//  SellCell.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 10..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SellCell: UITableViewCell {

    @IBOutlet weak var backImg: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workNameLabel: UILabel!
    @IBOutlet weak var workAuthorLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var sellerPhoneLabel: UILabel!
    @IBOutlet weak var sellerAdressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
}

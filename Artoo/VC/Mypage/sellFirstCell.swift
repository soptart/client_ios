//
//  sellFirstCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class sellFirstCell: UITableViewCell {

    
    @IBOutlet weak var sellImg: UIImageView!
    @IBOutlet weak var buyItem: UILabel!
    @IBOutlet weak var buyItemAuthor: UILabel!
    @IBOutlet weak var transaction: UILabel!
    @IBOutlet weak var seller: UILabel!
    @IBOutlet weak var sellerNumber: UILabel!
    @IBOutlet weak var sellerAddress: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

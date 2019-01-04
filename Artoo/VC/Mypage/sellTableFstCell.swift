//
//  sellTableFstCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class sellTableFstCell: UITableViewCell {

    @IBOutlet weak var sellItemImg: UIImageView!
    @IBOutlet weak var sellItemName: UILabel!
    @IBOutlet weak var sellItemAuthor: UILabel!
    @IBOutlet weak var sellItemTransaction: UILabel!
    @IBOutlet weak var buyerName: UILabel!
    @IBOutlet weak var buyerNumber: UILabel!
    @IBOutlet weak var buyerAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

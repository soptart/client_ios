//
//  sellTableSecondCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class sellTableSecondCell: UITableViewCell {

    @IBOutlet weak var transactionItemImg: UIImageView!
    @IBOutlet weak var transactionCounterItem: UILabel!
    @IBOutlet weak var transactionCounterItemAuthor: UILabel!
    @IBOutlet weak var transactionMethod: UILabel!
    @IBOutlet weak var transactionCounterName: UILabel!
    @IBOutlet weak var transactionCounterNumber: UILabel!
    @IBOutlet weak var transactionCounterAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

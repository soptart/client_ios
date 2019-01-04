//
//  MyPageReviewCell.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class MyPageReviewCell: UITableViewCell {

    
    @IBOutlet weak var reviewImg: UIImageView!
    @IBOutlet weak var reviewItem: UILabel!
    @IBOutlet weak var reviewBuyer: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var reviewDate: UILabel!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

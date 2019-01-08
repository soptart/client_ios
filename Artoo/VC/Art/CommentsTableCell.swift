//
//  CommentsTableCell.swift
//  Artoo
//
//  Created by 보윤 on 09/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class CommentsTableCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentsContent: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var commentsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

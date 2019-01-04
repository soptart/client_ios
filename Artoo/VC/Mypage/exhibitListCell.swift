//
//  exhibitListCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class exhibitListCell: UITableViewCell{

    
    @IBOutlet weak var exhibitTitle: UILabel!
    @IBOutlet weak var exhibitDate: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var artName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

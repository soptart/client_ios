//
//  exhibitListCell.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class AlarmExhibitCell: UITableViewCell{

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var exhibitNameLabel: UILabel!
    @IBOutlet weak var exhibitDateLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorWorkLabel: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

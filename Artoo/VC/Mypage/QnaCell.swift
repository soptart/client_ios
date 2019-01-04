//
//  QnaCell.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class Qna {
    var title: String?
    var subtitle: String?
    var expanded: Bool
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.expanded = false
    }
}
class QnaCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var expandBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(content: Qna) {
        let check = content.expanded
        self.title.text = content.title
        //        self.subtitleLabel.text = content.expanded ? content.subtitle : ""
        
        if check {
            self.title.textColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1)
            self.subTitle.text = content.subtitle
            self.expandBtn.setImage(UIImage(named: "up"), for: .normal)
        }else {
            self.title.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
            self.subTitle.text = ""
            self.expandBtn.setImage(UIImage(named: "down"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

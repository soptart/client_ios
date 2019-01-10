//
//  CommentsTableCell.swift
//  Artoo
//
//  Created by 보윤 on 09/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit


protocol CommentsTableCellDelegate : class {
    
    func deleteTapped(_ sender: CommentsTableCell)
    
}
class CommentsTableCell: UITableViewCell {

    var delegate: CommentsTableCellDelegate!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var commentsDate: UILabel!
    @IBOutlet weak var commentsContentTF: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func deleteBtn(_ sender: UIButton) {
        
        delegate?.deleteTapped(self)
    }

}

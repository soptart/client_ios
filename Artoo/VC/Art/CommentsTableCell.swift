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
    func editTapped(_ sender: CommentsTableCell)
    func saveTapped(_ sender: CommentsTableCell)
    
}
class CommentsTableCell: UITableViewCell {

    var delegate: CommentsTableCellDelegate!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var commentsDate: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var commentsContentTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteBtn(_ sender: UIButton) {
        
        delegate?.deleteTapped(self)
    }
    
    @IBAction func editBtn(_ sender: UIButton) {
        
        delegate?.editTapped(self)
        saveBtn.isHidden = false
        updateBtn.isHidden = true
        updateBtn.isEnabled = false
        saveBtn.isEnabled = true
        commentsContentTF.isEnabled = true
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        delegate?.saveTapped(self)
        saveBtn.isHidden = true
        updateBtn.isHidden = false
        saveBtn.isEnabled = false
        updateBtn.isEnabled = true
        commentsContentTF.isEnabled = false
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

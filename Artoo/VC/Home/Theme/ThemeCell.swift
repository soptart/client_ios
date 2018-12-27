//
//  ThemeCellTableViewCell.swift
//  Artoo
//


import UIKit

class ThemeCell: UITableViewCell {

    @IBOutlet weak var themeImg: UIImageView!
    
    @IBOutlet weak var themeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

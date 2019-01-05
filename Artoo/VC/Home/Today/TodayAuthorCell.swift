//  TodayAuthorCell.swift
//  Artoo
//// 작가 셀

import UIKit

class TodayAuthorCell: UICollectionViewCell {
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var lineImg: UIImageView!
    var delegate:AuthorCellDelegate!
    
    var indexPath:IndexPath!
    var cellSelected: Bool = false {
        didSet{
            cellSelected ? (lineImg.isHidden = false) : (lineImg.isHidden = true)
            
            if cellSelected {
                authorName.font = UIFont(name: "NotoSansCJKkr-Medium", size: 16.0)
                authorName.textColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0)
            }else {
                authorName.font = UIFont(name: "NotoSansCJKkr-Regular", size: 16.0)
                authorName.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0)
            }

        }
    }
    
    
}

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
        }
    }
    
    
}

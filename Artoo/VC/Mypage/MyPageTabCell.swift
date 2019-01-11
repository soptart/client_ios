//
//  MyPageTabCell.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 11..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class MyPageTabCell: UICollectionViewCell {
    
    @IBOutlet weak var indicatorImg: UIImageView!
    @IBOutlet weak var tabName: UILabel!
    @IBOutlet weak var tabCount: UILabel!
    
    var delegate:MyMainDelegate!
    
    var indexPath:IndexPath!
    var cellSelected: Bool = false {
        didSet{
            cellSelected ? (indicatorImg.isHidden = false) : (indicatorImg.isHidden = true)
            
            if cellSelected {
                tabName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 18.0)
                tabName.textColor = UIColor(red: 53/255, green: 61/255, blue: 70/255, alpha: 1.0)
                tabCount.font = UIFont(name: "NotoSansCJKkr-Bold", size: 18.0)
                tabCount.textColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0)
            }else {
                tabName.font = UIFont(name: "NotoSansCJKkr-Regular", size: 18.0)
                tabName.textColor = UIColor(red: 53/255, green: 61/255, blue: 70/255, alpha: 1.0)
                tabCount.font = UIFont(name: "NotoSansCJKkr-Regular", size: 18.0)
                tabCount.textColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0)
            }
            
        }
    }
}

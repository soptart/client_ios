//
//  exhibitApplyCell.swift
//  Artoo
//
//// 전시 선택 테이블뷰 셀

import UIKit

class ExhibitApplyCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var radioBtn: UIButton!
    
    //대신 처리해 줄 객체 정의
    var delegate:RadioBtnDelegate!
    var indexPath: IndexPath!
    var isRadioSelected: Bool = false {
        didSet {
            isRadioSelected ? radioBtn.setImage(UIImage(named: "ggobuk"), for: .normal) : radioBtn.setImage(UIImage(named: "jiu"), for: .normal)
        }
    }
    
    @IBAction func selectRadioBtn(_ sender: Any) {
        
        self.delegate.selectRadioBtn(at: indexPath)
    }
    
    
}

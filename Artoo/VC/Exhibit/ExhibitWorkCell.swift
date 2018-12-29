//
//  exhibitWorkCell.swift
//  Artoo
//
//// 전시신청서 - 내 작품 컬렉션 셀

import UIKit

class ExhibitWorkCell: UICollectionViewCell {
    @IBOutlet weak var workImg: UIImageView!
    @IBOutlet weak var radioBtn: UIButton!
    
    var delegate:RadioBtnDelegate!
    var indexPath:IndexPath!
    
    var isRadioSelected = false {
        didSet{
            isRadioSelected ? radioBtn.setImage(UIImage(named: "ggobuk"), for: .normal): radioBtn.setImage(UIImage(named: "jiu"), for: .normal)
        }
    }
    
    
    @IBAction func selectRadio(_ sender: Any) {
        //뷰 컨트롤러에 정의된 함수를 구현
        //해당 indexPath의 isRadioSelected 값을 변경
        self.delegate.cvSelectRadio(at: indexPath)
    }
}

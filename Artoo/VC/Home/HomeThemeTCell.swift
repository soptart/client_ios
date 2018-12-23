//
//  HomeThemeTCell.swift
//  Artoo

//// 테마 테이블 뷰 셀

import UIKit

class HomeThemeTCell: UITableViewCell {

    // 메인 태그
    @IBOutlet weak var mainTagLabel: UILabel!
    
    //태그 부연 설명
    @IBOutlet weak var subTagLabel: UILabel!
    
    //모두보기 버튼
    @IBOutlet weak var detailBtn: UIButton!
    
    //이미지 나타낼 콜렉션 뷰
    @IBOutlet weak var themeCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

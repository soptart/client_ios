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
    }

    //콜렉션 뷰 처리 - MVC를 해야 해서 여기서 Extension으로 콜렉션 뷰 처리하는 것은 옳지 않음
    //컨트롤러에서 처리하도록 해야함
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        themeCollectionView.delegate = dataSourceDelegate
        themeCollectionView.dataSource = dataSourceDelegate
        
        themeCollectionView.tag = row
        themeCollectionView.reloadData()
    }
    
    func reloadCollection(){
        themeCollectionView.reloadData()
    }
}



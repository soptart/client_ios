//
//  ExhibitSeeVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 28..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitSeeVC: UIViewController {
    
    @IBOutlet weak var escapeBtn: UIButton!
    var exhibitSeeList:[ExhibitSeeDetail] = []
    
    
    //전시 관람 콜렉션 뷰
    @IBOutlet weak var exhibitCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        //전시 퇴장 버튼
        escapeBtn.addTarget(self, action: #selector(escape), for: .touchUpInside)
        
        //전시 콜렉션뷰 하나의 셀만 보이도록
        exhibitCollectionView.isPagingEnabled = true
        exhibitCollectionView.delegate = self
        exhibitCollectionView.dataSource = self
    }
}


//콜렉션 뷰 Delegate
extension ExhibitSeeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width - 36
        let height = view.frame.height / 2
       
         return CGSize(width: width, height: height)
        
    }
    
    
    
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    //섹션 내부 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1, left: 1, bottom: 0, right: 1)
        
        
    }
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

//콜렉션 뷰 DataSource
extension ExhibitSeeVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exhibitSeeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExhibitSeeCell", for: indexPath) as! ExhibitSeeCell
        
        let data = exhibitSeeList[indexPath.row]
        cell.exhibitSeeImg.image = UIImage(named: data.exhibitImg)
        cell.workTitleLabel.text = data.workTitle
        cell.authorNameLabel.text = data.authorName
        cell.themeLabel.text = data.theme
        cell.sizeLabel.text = "\(data.widthSize)x\(data.heightSize)"
        cell.yearLabel.text = "\(data.year)"
        return cell
        
    }
}


extension ExhibitSeeVC {
    @objc func escape(){
        navigationController?.popViewController(animated: true)
    }
    
    func setData(){
        exhibitSeeList.append(ExhibitSeeDetail(exhibitIndex: 0, exhibitImg: "ggobuk",
                                         workTitle: "무제2(Untiitled)",
                                         authorName: "홍정민",
                                         theme: "페인팅",
                                         widthSize: 130,
                                         heightSize:163,                                    year: 2018))
            exhibitSeeList.append(ExhibitSeeDetail(exhibitIndex: 1, exhibitImg: "fire",
                                                    workTitle: "무제3(Untiitled)",
                                                    authorName: "홍정민",
                                                    theme: "수채화",
                                                    widthSize: 140,
                                                    heightSize:164,                                    year: 2019))
        
        
    }
}

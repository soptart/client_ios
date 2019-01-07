//
//  ExhibitSeeVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 28..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitSeeVC: UIViewController {
    
    
    
    var displayIdx:Int!
    var titleText:String!
    var exhibitSeeList = [ExhibitSee]()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var escapeBtn: UIButton!

    
    
    //전시 관람 콜렉션 뷰
    @IBOutlet weak var exhibitCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        setDelegate()
        setData(completion: setUI)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        titleLabel.text = titleText.newLineToBlank(str: titleText)
        titleLabel.sizeToFit()
        
        //전시 퇴장 버튼
        escapeBtn.addTarget(self, action: #selector(escape), for: .touchUpInside)
        
    }
}


//콜렉션 뷰 Delegate
extension ExhibitSeeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 236, height: 502)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 48
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
        cell.exhibitSeeImg.imageFromUrl(gsno(data.artImg), defaultImgPath: "")
        
        cell.workTitleLabel.text = gsno(data.artName)
        print("\(gsno(data.displayTitle))")
        cell.authorNameLabel.text = gsno(data.userName)
        cell.themeLabel.text = gsno(data.artForm)
        cell.sizeLabel.text = "\(gino(data.artWidth))x\(gino(data.artHeight))"
        cell.yearLabel.text = gsno(data.artYear)
        
    
        return cell
        
    }
}


extension ExhibitSeeVC {
    @objc func escape(){
        navigationController?.popViewController(animated: true)
    }
    
    func setUI(){
   
        exhibitCollectionView.reloadData()
        
    }
    func setDelegate(){
        //전시 콜렉션뷰 하나의 셀만 보이도록
        exhibitCollectionView.isPagingEnabled = true
        exhibitCollectionView.delegate = self
        exhibitCollectionView.dataSource = self
    }
    
    
    //초기 데이터 세팅
    func setData(completion: @escaping() -> Void){
        ExhibitSeeService.shared.exhibitSee(display_idx: displayIdx!) {
            (data) in guard let status = data.status else{ return }
            switch status{
            case 200:
                guard let data = data.data else { return }
                self.exhibitSeeList = data
                completion()
            case 404:
                print("전시회 존재X")
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
    
    
    
}

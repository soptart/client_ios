//
//  ExhibitSeeVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 28..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitSeeVC: UIViewController {
    
    
    var visibleIndex:IndexPath!
    var displayIdx:Int!
    var titleText:String!
    var exhibitSeeList = [ExhibitSee]()
    
    //현재 무슨 아이템인지 알려줌
    @IBOutlet weak var currentIndexLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var escapeBtn: UIButton!
    
    
    
    //전시 관람 콜렉션 뷰
    @IBOutlet weak var exhibitCollectionView: UICollectionView!
    
    
    //작품 상세 정보창으로 이동하는 컨트롤러
    private lazy var artBuyVC: BuyVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "choiceArt") as! BuyVC
        
        return viewController
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        setDelegate()
        setData(completion: setUI)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //전시 퇴장 버튼
        escapeBtn.addTarget(self, action: #selector(escape), for: .touchUpInside)
        
    }
    
    
    
    //스크롤 포지션 잡는 함수(나중에 공부다시해야함)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = exhibitCollectionView.contentOffset
        visibleRect.size = exhibitCollectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = exhibitCollectionView.indexPathForItem(at: visiblePoint) else { return }
        
        visibleIndex = indexPath
        currentIndexLabel.text = "\(visibleIndex.row + 1)/\(exhibitSeeList.count)"
        


    }
    
    
    
}


//콜렉션 뷰 Delegate
extension ExhibitSeeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 236, height: 502)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 139
    }
    
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = exhibitSeeList[indexPath.row]
        artBuyVC.sendArtIndex = data.artIndex!
        navigationController?.pushViewController(artBuyVC, animated: true)
        print("hihi")
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
        titleLabel.text = titleText.removeNewLine(str: titleText)
        titleLabel.sizeToFit()
        currentIndexLabel.text = "1/\(exhibitSeeList.count)"
        
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

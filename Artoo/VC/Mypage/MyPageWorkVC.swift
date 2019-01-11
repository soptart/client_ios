//
//  MyPageImgStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 31/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageWorkVC: UIViewController {
    
    
    //작품 업로드 하는 창
    private lazy var upLoadMainVC : UploadMainVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "uploadMain") as! UploadMainVC
        
        return viewController
    }()

    
    
    var workInfo:[MyArtWork]?
    @IBOutlet weak var uploadBtn: UIButton!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadBtn.addTarget(self, action: #selector(goUpLoad), for: .touchUpInside)
        imageCollection.dataSource = self
        imageCollection.delegate = self

    }
    
}

extension MyPageWorkVC {
//    @objc func showDialog(){
//        self.upLoadNotiVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        present(upLoadNotiVC, animated: true)
//    }
    
    @objc func goUpLoad(){
        present(upLoadMainVC, animated: true)
    }
    
}


extension MyPageWorkVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = workInfo?.count else {return 1}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier:"MyWorkCell", for: indexPath) as! MyWorkCell
        
        guard let data = workInfo?[indexPath.row] else {return UICollectionViewCell() }
        cell.showImg.imageFromUrl(gsno(data.aUrl), defaultImgPath: "")
        cell.showImg.roundImage(num: 0.08)
        
        return cell
    }
    
    
}

extension MyPageWorkVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 155, height: 213)
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let data = exhibitSeeList[indexPath.row]
        //        artBuyVC.sendArtIndex = data.artIndex!
        //        navigationController?.pushViewController(artBuyVC, animated: true)
        //        print("hihi")
    }
    
    
}

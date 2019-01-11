//
//  MyPageImgStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 31/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageWorkVC: UIViewController {

    var workInfo:[MyArtWork]?

    //collectionView하고 collectionController하고 연결해줌.
    @IBOutlet weak var imageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollection.dataSource = self
        imageCollection.delegate = self
    }
    
}

extension MyPageWorkVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = workInfo?.count else {return 1}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier:"MyWorkCell", for: indexPath) as! MyWorkCell
        
         let data = workInfo![indexPath.row]
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

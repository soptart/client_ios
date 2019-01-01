//
//  MyPageImgStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 31/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageImgStoreVC: UIViewController {

    var imageList = [ArtPhoto]()
    
    //collectionView하고 collectionController하고 연결해줌.
    @IBOutlet weak var imageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        
        imageCollection.dataSource = self
        imageCollection.delegate = self
    }
    
    //데이터 세팅해주기
    func setting(){
        imageList.append(ArtPhoto(artImg:"jiu"))
        imageList.append(ArtPhoto(artImg: "ggobuk"))
        imageList.append(ArtPhoto(artImg: "fire"))
        imageList.append(ArtPhoto(artImg: "buyDivideLine"))
        
    }
}

extension MyPageImgStoreVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"imagecell", for: indexPath) as! MyPageImgCell
        
        let image = imageList[indexPath.row]
        cell.showImg.image = UIImage(named:image.artImg)
        
        return cell
    }
    
    
}

extension MyPageImgStoreVC: UICollectionViewDelegateFlowLayout{
    
}

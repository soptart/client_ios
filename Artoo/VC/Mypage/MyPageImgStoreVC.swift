//
//  MyPageImgStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

var imageList:[String] = []

class MyPageImgStoreVC: UICollectionViewController {
   
    @IBOutlet var storeImageCollection: UICollectionView!
    //image배열
    private let reuseIdentifier = "Cell"


    override func viewDidLoad() {
        super.viewDidLoad()
        setting()

        storeImageCollection.dataSource = self
        storeImageCollection.delegate = self
        
    }

    func setting(){
        
        //데이터 세팅
        imageList.append("ggobuk")
        imageList.append("fire")
        imageList.append("jiu")
        
    }
    
    
}

extension MyPageStoreVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    
}

extension MyPageStoreVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "all_store_img", for: indexPath) as! MyPageImageStoreCell
        
        let data = imageList[indexPath.row]
        cell.showArt_img.image = UIImage(named:data)
        return cell
        
    }
    
    func 
}

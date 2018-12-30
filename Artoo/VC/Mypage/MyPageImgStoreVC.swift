//
//  MyPageImgStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class MyPageImgStoreVC: UICollectionViewController {
    @IBOutlet var storeImageCollection: UICollectionView!
    
    var imageList = [UIImage]() //image배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()

        storeImageCollection.dataSource = self
        storeImageCollection.delegate = self
        
    }

    func setting(){
        
        //데이터 세팅
        imageList.append(UIImage(named:"ggobuk")!)
        imageList.append(UIImage(named: "fire")!)
        imageList.append(UIImage(named: "jiu")!)
        
    }
    
    
}

extension MyPageStoreVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "all_store_img", for: indexPath) as! MyPageImageStoreCell
        
       
        
        
        return cell
        
    }
    
    
}

extension MyPageStoreVC : UICollectionViewDelegateFlowLayout {
    
}

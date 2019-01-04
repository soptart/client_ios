//
//  MyPageStoreVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageStoreVC: UIViewController {
    
    var storePhotos: [StoreArtPhoto] = []
    
    @IBOutlet weak var storeImgTable: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setting()
        
        storeImgTable.delegate = self
        storeImgTable.dataSource = self

    }
    
    func setting(){
        storePhotos.append(StoreArtPhoto(storeImg:"fire"))
        storePhotos.append(StoreArtPhoto(storeImg:"ggobuk"))
        storePhotos.append(StoreArtPhoto(storeImg:"01"))
        
    }

}

extension MyPageStoreVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"storeCell", for: indexPath) as! MyPageStoreCell
        
        let image = storePhotos[indexPath.row]
        cell.StoreImg.image = UIImage(named:image.storeImg)
        
        return cell
    }
    
    
}



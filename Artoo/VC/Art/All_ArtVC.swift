//
//  All_ArtVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class All_ArtVC: UIViewController {
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var figureLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    var sData: String?
    var fData: String?
    var cData: String?
    
    var imageList = [ArtImg]() //컬렉션 뷰를 위한 이미지 배열
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSetting()
        
        if let layout = imageCollection?.collectionViewLayout as? PinterLayout{
            layout.delegate = self
        }
        imageCollection.dataSource = self
        imageCollection.delegate = self
        setup()
        // Do any additional setup after loading the view.
        
    }
    
    
    func dataSetting(){
        imageList.append(ArtImg (artImg: "heartFull"))
        imageList.append(ArtImg (artImg: "heartEmpty"))
        imageList.append(ArtImg (artImg: "sopt_DoIT"))
        imageList.append(ArtImg (artImg: "exhibit"))
        imageList.append(ArtImg (artImg: "ggobuk"))
    }
    func setup() {
        //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
        if let sTransData = sData {
            sizeLabel.text = sTransData
        }
        
        if let fTransData = fData{
            figureLabel.text = fTransData
        }
        
        if let cTransData = cData{
            categoryLabel.text = cTransData
        }
    }
    
    //필터 버튼 눌렀을 때 필터 화면으로 넘어가기.
    @IBAction func filterBtn(_ sender: Any) {
        
        guard let fVC =
            storyboard?.instantiateViewController(withIdentifier: "filter") as? FilterViewController else{ return }
        navigationController?.pushViewController(fVC, animated: true)
        
    }
    
    
    
}

////collectionView extension확장기능
extension All_ArtVC : UICollectionViewDataSource{
    
    //섹션 당 아이템 몇개 보여줄래?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageList.count //2개
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! AllImageCell
        let image = imageList[indexPath.row]
        cell.showImg.image = UIImage(named: image.artImg)
        
        return cell
    }
    
}


//collectionView Delegate

extension All_ArtVC: UICollectionViewDelegateFlowLayout{
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return imageList.count
    //    }
    //
    //
    //    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! AllImageCell
    //        let image = imageList[indexPath.row]
    //        cell.showImg.image = UIImage(named: image.artImg)
    //
    //        return cell
    //    }
    
    //컬렉션 뷰 아이템 클릭 시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageIndex = indexPath.row
        let img = imageList[indexPath.row]
        let imageHeight = UIImage(named: img.artImg)?.size.height
        
        print(img.artImg) //값이 표시되나,,,? -> ok
        print(imageHeight)
        guard let bVC = storyboard?.instantiateViewController(withIdentifier: "choiceArt") as? BuyVC else {
            return
        }
        
        //        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //            let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        //            return CGSize(width: itemSize, height: itemSize)
        //        }
        //
        //        func numberOfSections(in collectionView: UICollectionView) -> Int {
        //                  return 1
        //            }
        //서버에서 전달해주는 이미지를 받아서 저장해줘야 함.
        
        
        bVC.images = img.artImg
        //화면간 이동하려고
        print(bVC.images) // -> 이것도 오키
        navigationController?.pushViewController(bVC, animated: true)
        
    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    //        return CGSize(width: itemSize, height: itemSize)
    //    }
}

extension All_ArtVC: PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat{
        
        //이거 다이나믹 제발 좀 해결,,,ㅎㅎ
        
        let imageHeight = UIImage(named: imageList[indexPath.row].artImg)?.size.height
        
        return imageHeight!
        
        //        let img = UIImage(named:imageList[indexPath.row].artImg)
        //       return 200
        
        /*
         //           return imageList[indexPath.item].artImg.frame.height
         //        return imageList[indexPath.item].art
         */
        
        //return img?.size.height ?? 200
        
        
        //return photos[indexPath.item].image.size.height
    }
    
}




//
//  All_ArtViewController.swift
//  Artoo
//
//  Created by 보윤 on 26/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class All_ArtViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var figureLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    var sData: String?
    var fData: String?
    var cData: String?
    
    var image = [String]() //컬렉션 뷰를 위한 이미지
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
        
        image = ["heartFull","heartEmpty","sopt_DoIT","exhibit","sopt_23rd_logo","ggobuk"]
        
        imageCollection.dataSource = self
//        imageCollection.delegate = self
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

//collectionView extension확장기능
extension All_ArtViewController : UICollectionViewDataSource{
    
    //섹션 당 아이템 몇개 보여줄래?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return image.count //2개
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! AllImageCell
        
        let image = UIImage(named:self.image[indexPath.row])
        cell.showImg.image = image
        
        return cell
    }
    
}

extension All_ArtViewController:
UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = view.frame.width
        
        let img = UIImage(named:self.image[indexPath.row])
        
        let height: CGFloat = img!.size.height
        
        return CGSize(width: width, height: height)
    }
}

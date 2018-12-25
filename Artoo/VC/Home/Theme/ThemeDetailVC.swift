//
//  ThemeDetailVC.swift
//  Artoo
//
//// 디테일 보기 화면 -> 서버 모델 구조 보고 확정

import UIKit


class ThemeDetailVC: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closeBtn.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
    }
    

}


extension ThemeDetailVC : UICollectionViewDelegateFlowLayout {
    
}


extension ThemeDetailVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
 
    
}




extension ThemeDetailVC  {
    
    //close버튼 클릭시 -> 모달 내려주는 함수
    @objc func closeDetail(){
        dismiss(animated: true, completion: nil)
    }
    
}



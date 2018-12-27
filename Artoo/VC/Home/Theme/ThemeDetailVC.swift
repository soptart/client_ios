//
//  ThemeDetailVC.swift
//  Artoo
//
//// 디테일 보기 화면 -> 서버 모델 구조 보고 확정

import UIKit


class ThemeDetailVC: UIViewController {

    var index:Int = 0
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    var detailList:Detail?
    
    override func viewWillAppear(_ animated: Bool) {
        ////이 태그 인덱스 값을 가지고 서버와 통신해서 detail 모델을 채움
        print("\(index)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        closeBtn.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)
        
        //콜렉션 뷰 델리게이트 설정
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
    }
    


}


extension ThemeDetailVC : UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
            let width = (view.frame.width) / 3 - 18
            let height = (view.frame.height) / 4 - 60
            return CGSize(width: width, height: height)
        
    }
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    
    //섹션 내부 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
    }
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // goArt()
        
    }
    
}


extension ThemeDetailVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let count = detailList?.detailImg.count else {
            return 1
        }
        return count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "ThemeDetailCell", for: indexPath) as! ThemeDetailCell
            if let data = detailList?.detailImg[indexPath.row]{
                cell.themeDetailImg.image = UIImage(named: data)
            }

            return cell
        
    }



}




extension ThemeDetailVC  {

    //초기 데이터 세팅 - 서버 통신 후 변경
    func setData(){
        detailList = Detail(mainTag: "#거실에 걸어두면 이쁠 것 같아", subTag: "허전했던 벽에 한 번 걸어보자", detailImg: ["ggobuk","fire", "recommand","jiu","meta", "ggobuk","fire", "recommand","jiu","meta","ggobuk","fire", "recommand","jiu","meta"
            ])
    }
    func goArt(){
        //작품 탭으로 이동(navigation)
    }
    
    //close버튼 클릭시 -> 모달 내려주는 함수
    @objc func closeDetail(){
        dismiss(animated: true, completion: nil)
    }
    
}

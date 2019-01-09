//
//  ThemeDetailVC.swift
//  Artoo
//
//// 디테일 보기 화면 -> 서버 모델 구조 보고 확정

import UIKit


class ThemeDetailVC: UIViewController {
    
    var index:Int = 0
    
    var mainImg:String = ""
    var mainTag:String = ""
    var subTag:String = ""
    
    @IBOutlet weak var themeImageView: UIImageView!
    
    @IBOutlet weak var mainTagLabel: UILabel!
    @IBOutlet weak var subTagLabel: UILabel!
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    var detailList = [ThemeDetail]()
    
    //작품 상세 정보창으로 이동하는 컨트롤러
    private lazy var artBuyVC: BuyVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "choiceArt") as! BuyVC
        
        return viewController
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        print("\(index)")
        setData()
        setDelegate()
        setLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        closeBtn.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)
        
    }
}


extension ThemeDetailVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 101, height: 101)
        
    }
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
 
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // goArt()
        guard let clickIndex = detailList[indexPath.item].themeIndex else { return }
        artBuyVC.sendArtIndex = clickIndex
        navigationController?.pushViewController(artBuyVC, animated: true)
        print("작품창으로 이동")
    }
    
}


extension ThemeDetailVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = detailList.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "ThemeDetailCell", for: indexPath) as! ThemeDetailCell
        if let photoUrl = detailList[indexPath.item].themeDetailImg {
            cell.themeDetailImg.imageFromUrl(photoUrl, defaultImgPath: "")
            cell.themeDetailImg.roundImage(num: 0.1)
        }
        
        return cell
        
    }
    
    
    
}




extension ThemeDetailVC  {
    
    func setDelegate(){
        //콜렉션 뷰 델리게이트 설정
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
    }
    
    //서버통신
    func setData(){
        ThemeDetailService.shared.themeDetail (index: index){
            (data) in guard let status = data.status else { return }

            switch status {
            case 200:
                guard let detailData = data.data else { return }
                self.detailList = detailData
                print("\(self.detailList)")
                print("success")
            case 404:
                self.detailList.removeAll()
                self.view.makeToast("컨텐츠가 존재하지 않습니다")
            case 500:
                self.detailList.removeAll()
                self.view.makeToast("서버 내부 에러")
            default:
                print("hi")
            }
            self.detailCollectionView.reloadData()

        }
    }
    
    
    func setLabel(){
        themeImageView.imageFromUrl(mainImg, defaultImgPath: "ggobuk")
        mainTagLabel.text = mainTag
        subTagLabel.text = subTag
    }
    
    
    //작품 탭으로 이동(navigation)
    func goArt(){
    }
    
    //close버튼 클릭시 -> 모달 내려주는 함수
    @objc func closeDetail(){
        dismiss(animated: true, completion: nil)
    }
    
}

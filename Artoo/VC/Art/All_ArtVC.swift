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
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var artCountLabel: UILabel!
    
    var filterData: Filter?
    var searchBarData: String?
    
    var imageList = [ArtImage]() //컬렉션 뷰를 위한 이미지 배열
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpData(completion: setUI) //서버에서 받은 데이터 저장 후에 뷰 띄우는 함수

        // Do any additional setup after loading the view.
        search.delegate = self
        imageCollection.contentInset = UIEdgeInsets(top: 6, left: 10, bottom: 10, right: 0)
        
        imageCollection.showsVerticalScrollIndicator = false
        imageCollection.contentInsetAdjustmentBehavior = .always
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        filterSetupData()
    }
    
    func setup() {
        //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
        if let sTransData = filterData?.size {
            sizeLabel.text = sTransData
        }
        
        if let fTransData = filterData?.figure {
            figureLabel.text = fTransData
        }
        
        if let cTransData = filterData?.category {
            categoryLabel.text = cTransData
        }
    }
    
    //필터 버튼 눌렀을 때 필터 화면으로 넘어가기.
    @IBAction func filterBtn(_ sender: Any) {
        
        guard let fVC =
            storyboard?.instantiateViewController(withIdentifier: "filter") as? FilterViewController else{ return }
        fVC.delegate = self
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
        cell.showImg.imageFromUrl(gsno(image.artImg), defaultImgPath: "ggobuk")
        
        
        return cell
    }
    
}

extension All_ArtVC: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.search.showsCancelButton = true
        if search.isFirstResponder == true{
            search.placeholder = nil
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.search.text = ""
        self.search.showsCancelButton = false
        self.search.endEditing(true) //키보드 내려감
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.search.endEditing(true)
        self.searchBarData = search.text!
    }
    
}


//collectionView Delegate

extension All_ArtVC: UICollectionViewDelegateFlowLayout{
    
    //컬렉션 뷰 아이템 클릭 시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageIndex = indexPath.row
        let img = imageList[indexPath.row]

        let imageHeight = UIImage(named: img.artImg!)?.size.height

        guard let bVC = self.storyboard?.instantiateViewController(withIdentifier: "choiceArt") as? BuyVC else {
            return
        }

        bVC.sendArtIndex = img.artIndex!
        //데이터이동
        self.navigationController?.pushViewController(bVC, animated: true)


    }

}

extension All_ArtVC: ZigzagLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath:IndexPath) -> CGFloat{
        
        let image = UIImage(named: gsno(imageList[indexPath.row].artImg!)) ?? UIImage()
        print("이미지 이미지 이미지 \(image)")
        let cropRatio = image.cropRatio2
        let heightOfRatio = (view.frame.width - 30) / 2 * cropRatio
        
        return heightOfRatio

    }
    
}

extension All_ArtVC{
    
    // 데이터를 불러올 때는 completion을 해야하는데, escaping()이거는 들어오는 인자를 말하는 거고 void는 반환할 형태가 null임을 말하는 것이다. 우리는 completion(setUI)이것을 사용하는데, 이것은 받는 인자는 없고 반환형태는 void라는 것을 알 수 있다.
    func setUpData(completion: @escaping() -> Void){
        CheckartWorksService.shared.check { (data) in
            guard let status = data.status else { return }
            
            print(status)
            
            switch status {
            case 200:
                if let allArtData = data.data {
                    //서버데이터를 todayList에 담아줌
                    self.imageList = allArtData
                    print("\(allArtData)")
                    print("하이 반갑고")
                    self.artCountLabel.text = String(describing: self.imageList.count)
                    completion() //-> 사실은 setUI함수가 호출되는 것이다.
                }
            case 400:
                print("나는 400이다")
            case 500:
                self.view.makeToast("네트워크 통신이 원활하지 않습니다")
            default:
                print("hi")
            }
        }
    }
    
    func filterSetupData() {
        guard filterData != nil else { return }
        filterService.shared.filter(artSize: filterData?.size ?? "", artForm: filterData?.figure ?? "", artCategory: filterData?.category ?? "", artKeyword: searchBarData ?? nil) {
            [weak self] data in
            guard let `self` = self else { return }
            guard let status = data.status else { return }
            print(status)
            
            switch status {
            case 200:
                if let allFilterData = data.data {
                    self.imageList = allFilterData
                    print("\(allFilterData)")
                    print("뭘 고를까")
                    self.imageCollection.reloadData()
                    self.artCountLabel.text = String(describing: self.imageList.count)
                }
            case 204:
                print("컨텐츠가 존재하지 않습니다")
            case 500:
                print("서버 내부 에러")
            default: print("필터검색")
            }
        }
    }
    
    
    func setUI(){
        setDelegate()
        imageCollection.reloadData()
    }
    
    func setDelegate(){
        
        
        if let layout = imageCollection?.collectionViewLayout as? ZigzagLayout{
            layout.delegate = self
        }else {
            print("하이하이하이하ㅣ아힝")
        }
        imageCollection.dataSource = self
        imageCollection.delegate = self
        
        
    }
    
}

extension All_ArtVC: FilterDataDelegate {
    func sendFilterData(data: Filter) {
        filterData = data
    }
}

extension UIImage{
    var cropRatio2: CGFloat {
        return CGFloat(self.size.height / self.size.width)
    }
}



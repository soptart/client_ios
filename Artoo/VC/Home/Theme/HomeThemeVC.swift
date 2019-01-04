//
//  HomeThemeVC.swift
//  Artoo
//
//// 홈 - 테마

import UIKit

class HomeThemeVC: UIViewController {
    
    //테마 테이블 뷰
    @IBOutlet weak var themeTableView: UITableView!
    
    //태그 콜렉션 뷰
    @IBOutlet weak var tagCV: UICollectionView!
    
    //추천 테이블 헤더
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var allBtn: UIButton!
    
    //추천 콜렉션 뷰
    @IBOutlet weak var recommandCV: UICollectionView!
    
    //테마 테이블뷰
    @IBOutlet weak var themeTV: UITableView!
    
    
    //테마 데이터
    var themeList = [Theme]()
    
    var tagIndex = 1
    var mainTag:String = ""
    var subTag:String = ""
    
    
    //태그 이미지 배열
    var tagList:[String] = ["themeHappy","themeUnfathomable","themeFancy","themeSimple","themeSesitive",
                            "themeCute","themeSpring","themeSummer","themeFall","themeWinter"]
    
    
    
    //테마 자세히 보는 화면 VC
    private lazy var themeDetailVC : ThemeDetailVC = {
        let storyboard = Storyboard.shared().homeStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ThemeDetailVC.reuseIdentifier) as! ThemeDetailVC
        
        return viewController
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setData(completion: setUI)
        allBtn.addTarget(self, action: #selector(goDetail2), for: .touchUpInside)
        
    }
    
}


//테이블 뷰 DataSource
extension HomeThemeVC : UITableViewDataSource {
    
    //섹션 당 행의 개수
    //섹션이 하나라면 그냥 개수를 리턴하면 됨
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themeList.count - 1 //추천 빼고
    }
    
    //셀에 대한 처리
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! ThemeCell
        
        
        let data = themeList[indexPath.row + 1]
        if let themePhotoUrl = data.themeImg {
            cell.themeImg.imageFromUrl(themePhotoUrl, defaultImgPath: "ggobuk")
            cell.themeImg.roundImage(num: 0.05)
        }
        
        if let themeText = data.mainTag {
            cell.themeLabel.text = removeNewLine(str: themeText)
        }
        
        return cell
    }
    
    
    
    
}

//테이블 뷰 Delegate
extension HomeThemeVC : UITableViewDelegate {
    //테마 테이블 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = themeList[indexPath.row + 1]
        
        guard let index = data.tagIndex else { return }
        tagIndex = index
        
        guard let mainTagData = data.mainTag else { return }
        mainTag = mainTagData
        
        guard let subTagData = data.subTag else { return }
        subTag = subTagData
        
        goDetail()
    }
    
}


//콜렉션 뷰 Delegate
extension HomeThemeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case tagCV:
            let width = (view.frame.width) / 5 - 15
            let height = (view.frame.height) / 20
            return CGSize(width: width, height: height)
        case recommandCV:
            return CGSize(width: 150, height: 202)
        default:
            return CGSize(width: 1, height: 1)
        }
        
    }
    
    
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
    
    //섹션 내부 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        
        
    }
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case tagCV:
            let themeData = themeList[indexPath.row]
            
            guard let index = themeData.tagIndex else { return }
            tagIndex = index
            
            guard let mainTagData = themeData.mainTag else { return }
            mainTag = mainTagData
            
            guard let subTagData = themeData.subTag else { return }
            subTag = subTagData
            
            goDetail()
            
        case recommandCV:
            print("작품창으로 이동")
        default:
            print("hi")
        }
    }
    
}

//콜렉션 뷰 DataSource
extension HomeThemeVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case tagCV:
            return tagList.count
        case recommandCV:
            guard let recommandData = themeList.first?.themeWork else {
                return 1
            }
            return recommandData.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case tagCV:
            //태그 셀
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
            
            let tagImage = tagList[indexPath.row]
            cell.tagImg.image = UIImage(named: tagImage)
            
            return cell
            
        case recommandCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCell", for: indexPath) as! RecommandCell
            
            if let recommandData = themeList.first?.themeWork?[indexPath.row] {
                let photoUrl = recommandData.workImg
                cell.recommandImg.imageFromUrl(photoUrl, defaultImgPath: "ggobuk")
                cell.recommandImg.roundImage(num: 0.05)
   
            }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}






extension HomeThemeVC {
    
    //서버 통신
    func setData(completion: @escaping() -> Void) {
        HomeThemeService.shared.theme {
            (data) in guard let themeData = data.data else { return }
            self.themeList = themeData
            print("\(self.themeList)")
            completion()
        }
    }
    
    
    //델리게이트 세팅
    func setDelegate(){
        tagCV.delegate = self
        tagCV.dataSource = self
        
        recommandCV.delegate = self
        recommandCV.dataSource = self
        
        themeTV.delegate = self
        themeTV.dataSource = self
    }
    
    
    //추천 컬렉션 뷰 부분 데이터 세팅(리스트의 첫번째 데이터들로 채워줌)
    func setUI(){
        guard let data = themeList.first else { return }
        
        let photoUrl = data.themeImg
        mainImageView.imageFromUrl(photoUrl, defaultImgPath: "fire")
        
        if let mainText = data.mainTag {
            
            if(mainText.contains("\\n")){
                let newText = mainText.replacingOccurrences(of: "\\n", with: "\n")
                mainLabel.text = newText
            }else {
                mainLabel.text = mainText
            }
        }
        self.recommandCV.backgroundView = mainImageView
    }
    
    //디테일 창으로 이동
    @objc func goDetail(){
        //메인 태그, 서브 태그 , 인덱스
        themeDetailVC.index = tagIndex
        themeDetailVC.mainTag = removeNewLine(str: mainTag)
        themeDetailVC.subTag = subTag
        present(themeDetailVC, animated: true, completion: nil)
    }
    
    @objc func goDetail2(){
        
        guard let themeData = themeList.first else { return }
        
        guard let index = themeData.tagIndex else { return }
        tagIndex = index
        
        guard let mainTagData = themeData.mainTag else { return }
        mainTag = mainTagData
        
        guard let subTagData = themeData.subTag else { return }
        subTag = subTagData
        
        themeDetailVC.index = tagIndex
        themeDetailVC.mainTag = removeNewLine(str: mainTag)
        themeDetailVC.subTag = subTag
        present(themeDetailVC, animated: true, completion: nil)
    }
    
    
    // \\n -> \n으로 바꾸어 주는 함수
    func removeNewLine(str: String) -> String {
        if(str.contains("\\n")){
            let newText = str.replacingOccurrences(of: "\\n", with: "\n")
            return newText
        }
        return str
    }
    
}

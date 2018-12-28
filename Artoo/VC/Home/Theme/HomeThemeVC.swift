//
//  HomeThemeVC.swift
//  Artoo
//
//// 홈 - 테마

import UIKit

class HomeThemeVC: UIViewController {

    @IBOutlet weak var themeTableView: UITableView!
    
    //태그 콜렉션 뷰
    @IBOutlet weak var tagCV: UICollectionView!
    
    //추천 테이블 헤더
    @IBOutlet weak var mainImageView: UICollectionView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var allBtn: UIButton!

    //추천 콜렉션 뷰
    @IBOutlet weak var recommandCV: UICollectionView!
    
    //테마 테이블뷰
    @IBOutlet weak var themeTV: UITableView!
    
    
    //테마 데이터 - 서버 통신 시 수정 필요
    var themeList:Theme?
   
    
    //태그에 따라 아래 데이터들이 변경되도록
    var tagIndex = 0
    
    
    //테마 자세히 보는 화면 VC
    private lazy var themeDetailVC : ThemeDetailVC = {
        let storyboard = Storyboard.shared().homeStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ThemeDetailVC.reuseIdentifier) as! ThemeDetailVC
        
        return viewController
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        tagCV.delegate = self
        tagCV.dataSource = self
        
        recommandCV.delegate = self
        recommandCV.dataSource = self
        
        themeTV.delegate = self
        themeTV.dataSource = self
        
        allBtn.addTarget(self, action: #selector(goDetail), for: .touchUpInside)
        
    }

}


//테이블 뷰 DataSource
extension HomeThemeVC : UITableViewDataSource {
    
    //섹션 당 행의 개수
    //섹션이 하나라면 그냥 개수를 리턴하면 됨
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = themeList?.theme.count else {
            return 1
        }
        return count
    }
    
    //셀에 대한 처리
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! ThemeCell
        if let data = themeList?.theme[indexPath.row] {
            cell.themeImg.image = UIImage(named: data.themeImg)
            cell.themeLabel.text = data.themeStr

        }
        
        return cell
    }
    
    
    
    
}

//테이블 뷰 Delegate
extension HomeThemeVC : UITableViewDelegate {
    //테마 테이블 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = themeList?.tag[indexPath.row].tagIndex {
            goDetail(index: index)
        }
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
            let width = (view.frame.width) / 2 - 32
            let height = (view.frame.height) / 4 + 10
            return CGSize(width: width, height: height)
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
            goDetail(index: indexPath.row)
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case tagCV:
            guard let count = themeList?.tag.count else {
                return 1
            }
            return count
        case recommandCV:
            guard let count = themeList?.recommand.recommandImg.count else {
                return 1
            }
            return count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case tagCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
           
            if let data = themeList?.tag[indexPath.row]{
                cell.tagStr.text = data.tagStr
            } else {
                cell.tagStr.text = "태그 없음"
            }
            
            return cell
            
        case recommandCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCell", for: indexPath) as! RecommandCell
            if let data = themeList?.recommand.recommandImg[indexPath.row]{
                cell.recommandImg.image = UIImage(named: data)
            } else {
                cell.recommandImg.image = UIImage(named: "ggobuk")
                return cell
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}






extension HomeThemeVC {
    func setData() {
        //쓰레기 값, 서버 통신 후 변경
        themeList = Theme(tag: [Tag(tagStr: "태그1", tagIndex: 0),
                                Tag(tagStr: "태그2", tagIndex: 1),
                                Tag(tagStr: "태그3", tagIndex: 2),
                                Tag(tagStr: "태그4", tagIndex: 3),
                                Tag(tagStr: "태그5", tagIndex: 4)],
                          recommand: Recommand(recommandStr: "거실에 걸어두면 느낌 있는 그림들", recommandImg: ["recommand","recommand", "recommand","recommand","recommand"]),
                          theme: [ThemeDetail(themeStr: "하이1", themeImg: "theme"), ThemeDetail(themeStr: "하이2", themeImg: "theme"),
                                   ThemeDetail(themeStr: "하이3", themeImg: "theme"),
                                    ThemeDetail(themeStr: "하이4", themeImg: "theme"),
                                     ThemeDetail(themeStr: "하이5", themeImg: "theme")])
  
    }
    
    
    //디테일 창으로 이동
    @objc func goDetail(index:Int){
        themeDetailVC.index = index
        present(themeDetailVC, animated: true, completion: nil)
    }

}

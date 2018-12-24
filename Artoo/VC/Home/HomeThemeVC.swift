//
//  HomeThemeVC.swift
//  Artoo
//
//// 홈 - 테마

import UIKit

class HomeThemeVC: UIViewController {

    @IBOutlet weak var themeTableView: UITableView!
    
    var themeList: [Theme] = []
    var tableIndex = 0
    
    
    //테마 자세히 보는 화면 VC
    private lazy var themeDetailVC : ThemeDetailVC = {
        let storyboard = Storyboard.shared().homeStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ThemeDetailVC.reuseIdentifier) as! ThemeDetailVC
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeTableView.delegate = self
        themeTableView.dataSource = self
        setData() //초기 데이터 설정
    }

}


//테이블 뷰 DataSource
extension HomeThemeVC : UITableViewDataSource {
    
    //섹션 당 행의 개수
    //섹션이 하나라면 그냥 개수를 리턴하면 됨
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themeList.count
    }
    
    //셀에 대한 처리
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! HomeThemeTCell
        
        tableIndex = indexPath.row
        cell.reloadCollection()
        
        //테이블 인덱스에 따라 콜렉션 뷰의 데이터를 변경해 줌
        let themeData = themeList[indexPath.row]
       
        //메인 태그
        cell.mainTagLabel.text = themeData.mainTag
        //서브 태그
        cell.subTagLabel.text = themeData.subTag
       
        //자세히 보기 버튼
        cell.detailBtn.tag = indexPath.row
        cell.detailBtn.addTarget(self, action: #selector(detailBtnClick), for: .touchUpInside)
        
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    cell.reloadCollection()
        
        return cell
    }
    
    
    
    
}

//테이블 뷰 Delegate
extension HomeThemeVC : UITableViewDelegate {
    
    
    
}


//콜렉션 뷰 Delegate
extension HomeThemeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width) / 3
        let height = (view.frame.height) / 4
        return CGSize(width: width, height: height)
    }
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    
    //섹션 내부 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        
    }
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}

//콜렉션 뷰 DataSource
extension HomeThemeVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeThemeCell", for: indexPath) as! HomeThemeCell
        
        let collectionImg = themeList[tableIndex].themeImg[indexPath.row]
        cell.themeImg.image = UIImage(named: collectionImg.themeImg)
        
        return cell
    }
}






extension HomeThemeVC {
    func setData() {
        //쓰레기 값, 서버 통신 후 변경
        themeList.append(Theme(mainTag: "#하이1", subTag: "하이1", themeImg: [ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "fire"),
                ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "fire")]))
        
        themeList.append(Theme(mainTag: "#하이2", subTag: "하이2", themeImg: [ThemeImg(themeImg: "jiu"),ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "jiu"),ThemeImg(themeImg: "ggobuk")]))
        
        themeList.append(Theme(mainTag: "#하이3", subTag: "하이3", themeImg: [ThemeImg(themeImg: "meta"),ThemeImg(themeImg: "fire"),ThemeImg(themeImg: "meta"),ThemeImg(themeImg: "fire")]))
        
        themeList.append(Theme(mainTag: "#하이4", subTag: "하이4", themeImg: [ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "meta"), ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "meta")]))
    }
    
    
    @objc func detailBtnClick(){
        navigationController?.pushViewController(themeDetailVC, animated: true)
    }

}

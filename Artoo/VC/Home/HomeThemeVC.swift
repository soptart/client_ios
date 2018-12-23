//
//  HomeThemeVC.swift
//  Artoo
//
//// 홈 - 테마

import UIKit

class HomeThemeVC: UIViewController {

    @IBOutlet weak var themeTableView: UITableView!
    
    var themeList: [Theme] = []
    
    //테마 자세히 보는 화면
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

extension HomeThemeVC : UITableViewDataSource {
    
    //섹션 당 행의 개수
    //섹션이 하나라면 그냥 개수를 리턴하면 됨
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themeList.count
    }
    
    //셀에 대한 처리
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! HomeThemeTCell
        
        let themeData = themeList[indexPath.row]
       
        //메인 태그
        cell.mainTagLabel.text = themeData.mainTag
        //서브 태그
        cell.subTagLabel.text = themeData.subTag
       
        //자세히 보기 버튼
        cell.detailBtn.tag = indexPath.row
        cell.detailBtn.addTarget(self, action: #selector(detailBtnClick), for: .touchUpInside)
        
    
        
        return cell
    }
    
    
    
    
}

extension HomeThemeVC : UITableViewDelegate {
    
}


extension HomeThemeVC {
    func setData() {
        //쓰레기 값, 서버 통신 후 변경
        themeList.append(Theme(mainTag: "#하이1", subTag: "하이1", themeImg: [ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "fire")]))
        
        themeList.append(Theme(mainTag: "#하이2", subTag: "하이2", themeImg: [ThemeImg(themeImg: "jiu"),ThemeImg(themeImg: "ggobuk")]))
        
        themeList.append(Theme(mainTag: "#하이3", subTag: "하이3", themeImg: [ThemeImg(themeImg: "meta"),ThemeImg(themeImg: "fire")]))
        
        themeList.append(Theme(mainTag: "#하이4", subTag: "하이4", themeImg: [ThemeImg(themeImg: "ggobuk"),ThemeImg(themeImg: "meta")]))
    }
    
    
    @objc func detailBtnClick(){
        navigationController?.pushViewController(themeDetailVC, animated: true)
    }

}

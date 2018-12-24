//
//  HomeTodayVC.swift
//  Artoo
//


import UIKit

class HomeTodayVC: UIViewController {
    
    @IBOutlet  var authorCollection: UICollectionView!
    @IBOutlet  var workCollection: UICollectionView!
    
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var workNameLabel: UILabel!
    @IBOutlet var workDetailLabel: UILabel!
    
    
    //서버 통신 걸 때 변경
    //작가 콜렉션에 사용할 모델
    var authorList = [Author]()
    var authorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        
        //작가 콜렉션 스크롤 불가하게 막기
        authorCollection.isScrollEnabled = false
        
        
        //작가 콜렉션 delegate 위임
        authorCollection.delegate = self
        authorCollection.dataSource = self
        
        //작품 콜렉션 delegate 위임
        workCollection.delegate = self
        workCollection.dataSource = self
        
    }
    
    
    func setting() {
        //데이터 세팅
        //서버 데이터 통신으로 변경
        authorList.append( Author (authorImg: "ggobuk", authorName: "최윤정",
                                 authorWork: [Work(workImg: "ggobuk",workName: "꼬북1", workDetail: "2017년 작"),
                                              Work(workImg: "ggobuk",workName: "꼬북2", workDetail: "2018년 작"),
                                              Work(workImg: "ggobuk",workName: "꼬북3", workDetail: "2019년 작"),
                                              Work(workImg: "ggobuk",workName: "꼬북4", workDetail: "2020년 작"),
                                              Work(workImg: "ggobuk",workName: "꼬북5", workDetail: "2021년 작")] ) )
        
        authorList.append( Author (authorImg: "fire", authorName: "이세은",
                                   authorWork: [Work(workImg: "fire",workName: "파이리1", workDetail: "2017년 작"),
                                                Work(workImg: "fire",workName: "파이리2", workDetail: "2018년 작"),
                                                Work(workImg: "fire",workName: "파이리3", workDetail: "2019년 작"),
                                                Work(workImg: "fire",workName: "파이리4", workDetail: "2020년 작"),
                                                Work(workImg: "fire",workName: "파이리5", workDetail: "2021년 작")] ) )

        authorList.append( Author (authorImg: "jiu", authorName: "윤여진",
                                   authorWork: [Work(workImg: "jiu",workName: "이름1", workDetail: "2017년 작"),
                                                Work(workImg: "jiu",workName: "이름2", workDetail: "2018년 작"),
                                                Work(workImg: "jiu",workName: "이름3", workDetail: "2019년 작"),
                                                Work(workImg: "jiu",workName: "이름4", workDetail: "2020년 작"),
                                                Work(workImg: "jiu",workName: "이름5", workDetail: "2021년 작")] ) )

        authorList.append( Author (authorImg: "king", authorName: "한선민",
                                   authorWork: [Work(workImg: "king",workName: "이름1", workDetail: "2017년 작"),
                                                Work(workImg: "king",workName: "이름2", workDetail: "2018년 작"),
                                                Work(workImg: "king",workName: "이름3", workDetail: "2019년 작"),
                                                Work(workImg: "king",workName: "이름4", workDetail: "2020년 작"),
                                                Work(workImg: "king",workName: "이름5", workDetail: "2021년 작")] ) )

        authorList.append( Author (authorImg: "meta", authorName: "김정음",
                                   authorWork: [Work(workImg: "meta",workName: "이름1", workDetail: "2017년 작"),
                                                Work(workImg: "meta",workName: "이름2", workDetail: "2018년 작"),
                                                Work(workImg: "meta",workName: "이름3", workDetail: "2019년 작"),
                                                Work(workImg: "meta",workName: "이름4", workDetail: "2020년 작"),
                                                Work(workImg: "meta",workName: "이름5", workDetail: "2021년 작")] ) )

 
        
        //통신 성공 시 label에 값들 넣어줌 -> 아닐시에도 처리해야함
        let firstAuth = authorList[0]
        authorLabel.text = firstAuth.authorName + " 작가"
        
        guard let firstWork = firstAuth.authorWork.first else{
            return
        }
        
        workNameLabel.text = firstWork.workName
        workDetailLabel.text = firstWork.workDetail
    }
    
    
}
//CollectionView를 위한 Extension
extension HomeTodayVC : UICollectionViewDataSource {
    
    
    //섹션 당 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    //섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //cell에 데이터 세팅
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case authorCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorCell", for: indexPath) as! TodayAuthorCell
            let authorInfo = authorList[indexPath.row]
            cell.authorImg.image = UIImage(named: authorInfo.authorImg)
            cell.authorName.text = authorInfo.authorName
            
            return cell
            
        case workCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! TodayWorkCell
            print(authorIndex)
            let workInfo = authorList[authorIndex].authorWork[indexPath.row]
            cell.workImg.image = UIImage(named: workInfo.workImg)
            
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}


extension HomeTodayVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //사이즈 재조정 필요
        switch collectionView {
        case authorCollection:
            let width = (view.frame.width) / 6
            let height = (view.frame.height) / 6
            return CGSize(width: width, height: height)
            
        case workCollection:
            let width = (view.frame.width - 20) / 3
            let height = (view.frame.height) / 3
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 0, height: 0)
        }
        
        
    }
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    
    //섹션 내부 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        //사이즈 재조정 필요
        case authorCollection:
            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        case workCollection:
            return UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
            
        case authorCollection:
            authorIndex = indexPath.row
            workCollection.reloadData()
            selectCellInit()
            let authorInfo = authorList[indexPath.row]
            authorLabel.text = authorInfo.authorName + " 작가"
        case workCollection:
            let workInfo =  authorList[authorIndex].authorWork[indexPath.row]
            workNameLabel.text = workInfo.workName 
            workDetailLabel.text = workInfo.workDetail
        default:
            return
        }
    }
    
    func selectCellInit() {
        //작가 클릭 시 아래 작품 콜렉션뷰 reload와 동시에 첫번째 작품으로
        //이름과 작품설명이 바뀌어야 함
        
        if let firstWork = authorList[authorIndex].authorWork.first {
            workNameLabel.text = firstWork.workName
            workDetailLabel.text = firstWork.workDetail
        } else {
            workNameLabel.text = "작품 이름이 없습니다"
            workDetailLabel.text = "작품 설명이 없습니다."
        }
    }
    
}


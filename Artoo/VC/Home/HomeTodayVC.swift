//
//  HomeTodayVC.swift
//  Artoo
//


import UIKit

class HomeTodayVC: UIViewController {
    
    @IBOutlet  var authorCollection: UICollectionView!
    @IBOutlet  var workCollection: UICollectionView!
    
    //서버 통신 걸 때 변경
    
    //작가 콜렉션에 사용할 모델
    var authorList = [Author]()
    
    //작품 콜렉션에 사용할 모델
    var workList = [Work]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetting()
        
        //작가 콜렉션 스크롤 불가
        authorCollection.isScrollEnabled = false
        
        
        //작가 콜렉션 delegate 위임
        authorCollection.delegate = self
        authorCollection.dataSource = self
        
       //작품 콜렉션 delegate 위임
        workCollection.delegate = self
        workCollection.dataSource = self
        
    }
    
    func dataSetting() {
        //서버 데이터 통신으로 변경
        authorList.append(Author(authorImg: "ggobuk", authorName: "하이"))
        authorList.append(Author(authorImg: "ggobuk", authorName: "하이"))
        authorList.append(Author(authorImg: "ggobuk", authorName: "하이"))
        authorList.append(Author(authorImg: "ggobuk", authorName: "하이"))
        authorList.append(Author(authorImg: "ggobuk", authorName: "하이"))

        workList.append(Work(workImg: "ggobuk",workName: "이름1", workDetail: "설명1"))
        workList.append(Work(workImg: "ggobuk",workName: "이름2", workDetail: "설명2"))
        workList.append(Work(workImg: "ggobuk",workName: "이름3", workDetail: "설명3"))
        workList.append(Work(workImg: "ggobuk",workName: "이름4", workDetail: "설명4"))
        workList.append(Work(workImg: "ggobuk",workName: "이름5", workDetail: "설명5"))

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
            let workInfo = workList[indexPath.row]
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
            let width = (view.frame.width - 20) / 4
            let height = (view.frame.height - 40) / 4
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
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

    }
}


//
//  HomeTodayVC.swift
//  Artoo
//


import UIKit

class HomeTodayVC: UIViewController {
    
    //정적 데이터인 시리즈 테이블뷰
    @IBOutlet weak var seriesTableView: UITableView!
    
    @IBOutlet  var authorCollection: UICollectionView!
    @IBOutlet  var workCollection: UICollectionView!
    
    var selectedIndex:IndexPath!
    
    var todayList = [Today]()
    let seriesList = ["today_demo1","today_demo2"]
    var authorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //서버 통신해서 todayList 채우기
        getToday()
        //서버정보가 아닌 시리즈 정보들(디자이너 데이터)
        seriesTableView.delegate = self
        seriesTableView.dataSource = self
    }
    
    
}

////시리즈 TableView를 위한 Extension

extension HomeTodayVC : UITableViewDelegate {
    //클릭 이벤트 처리
}

extension HomeTodayVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = seriesTableView.dequeueReusableCell(withIdentifier: "HomeSeriesCell") as! HomeSeriesCell
        cell.homeSeriesImg.image = UIImage(named: seriesList[indexPath.row])
        return cell
    }
    
    
}



////CollectionView를 위한 Extension
extension HomeTodayVC : UICollectionViewDataSource {
    
    
    //섹션 당 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == authorCollection {
            return todayList.count
        }else {
            return (todayList[authorIndex].authorWork?.count)!
        }
        
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
            
            cell.delegate = self
            cell.indexPath = indexPath

            
            if selectedIndex == indexPath {
                cell.cellSelected = true
            }else {
                cell.cellSelected = false
            }
            
            
            //작가 이름
            let todayData = todayList[indexPath.row]
            cell.authorName.text = todayData.authorName
            cell.authorName.sizeToFit()
            return cell
            
        case workCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! TodayWorkCell
            
            let workInfo = todayList[authorIndex] //작가에 대한 대략적 정보
            let detailWorkInfo = workInfo.authorWork![indexPath.row]
            
            let photoUrl = detailWorkInfo.workImg!
            cell.workImg.imageFromUrl(photoUrl, defaultImgPath: "ggobuk")
            
            if(indexPath.row != 0){
                cell.authorIntro.isHidden = true
                cell.authorName.isHidden = true
                cell.schoolLabel.isHidden = true
                cell.img.isHidden = true
                cell.arrowImg.isHidden = true
            }else {
                cell.authorIntro.isHidden = false
                cell.authorName.isHidden = false
                cell.schoolLabel.isHidden = false
                cell.img.isHidden = false
                cell.arrowImg.isHidden = false
                
                
                cell.authorName.text = gsno(workInfo.authorName)
                cell.schoolLabel.text = gsno(workInfo.authorSchool)
                cell.authorIntro.text = gsno(workInfo.authorIntro)
                
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}


extension HomeTodayVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case authorCollection:
            return CGSize(width: 44, height: 29)
        case workCollection:
            return CGSize(width: 250, height: 347)
        default:
            return CGSize(width: 0, height: 0)
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //사이즈 재조정 필요
        switch collectionView {
        case authorCollection:
            return 30
        case workCollection:
            return 43
        default:
            return 0
        }
    }
    
    
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
            
        case authorCollection:
            authorIndex = indexPath.row
            let cell =  authorCollection.cellForItem(at: indexPath) as! TodayAuthorCell
            cell.delegate.selectAuthor(at: indexPath)
            
            //스크롤 포지션을 처음으로 되돌림
            workCollection.reloadData()
            workCollection.contentOffset.x = 0
        case workCollection:
            //작품창으로 이동
            print("hihi")
        default:
            return
        }
    }
    
}
extension HomeTodayVC : AuthorCellDelegate {
    func selectAuthor(at indexPath: IndexPath) {
        selectedIndex = indexPath
        authorCollection.reloadData()
    }
    
}
extension HomeTodayVC {
    func getToday() {
        HomeTodayService.shared.today { (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status {
            case 200:
                if let todayData = data.data {
                    //서버데이터를 todayList에 담아줌
                    self.todayList = todayData
                    print("\(self.todayList)")
                    //다 담은 후 delegate 설정해주기
                    self.setDelegate()
                }
            case 500:
                self.view.makeToast("네트워크 통신이 원활하지 않습니다")
            default:
                print("hi")
            }
        }
    }
    
    
    func setDelegate(){
        //작가 콜렉션 스크롤 불가하게 막기
        authorCollection.isScrollEnabled = false
        
        
        //작가 콜렉션 delegate 위임
        authorCollection.delegate = self
        authorCollection.dataSource = self
        
        //작품 콜렉션 delegate 위임
        workCollection.delegate = self
        workCollection.dataSource = self
    }
}


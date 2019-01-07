//
//  ExhibitApplyVC.swift
//  Artoo
//
//// 전시 신청 창

import UIKit

class ExhibitApplyVC: UIViewController {
    var selectedIndexPath: IndexPath!
    var cvSelectedIndexPath: IndexPath!
    
    
    @IBOutlet weak var applyBtnConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var applyScrollView: UIScrollView!
    
    //신청 버튼
    @IBOutlet weak var applyBtn: UIButton!
    
    //전시 테이블뷰
    @IBOutlet weak var exhibitTV: UITableView!
    
    //내 작품 컬렉션뷰
    @IBOutlet weak var myWorkCV: UICollectionView!
    
    //닫기 버튼
    @IBOutlet weak var closeBtn: UIButton!
    
    //전시기간 라벨
    @IBOutlet weak var dateLabel: UILabel!
    
    //신청기간 라벨
    @IBOutlet weak var deadLineLabel: UILabel!
    
    //작품 수 라벨
    @IBOutlet weak var numberLabel: UILabel!
    
    //신청인원 라벨
    @IBOutlet weak var personLabel: UILabel!
    
    //내 작품이 없을 때만 나타나는 뷰
    @IBOutlet weak var workEmptyView: UIView!
    
    
    var exhibitApplyList:ExhibitApply?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workEmptyView.isHidden = true
        setDelegate()
        setData(completion: setUI)
        
        //닫기 버튼 누르면 dismiss
        closeBtn.addTarget(self, action: #selector(closeApply), for: .touchUpInside)
    }
    
    
    //스크롤뷰를 이용해서 버튼 숨기기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == applyScrollView){
            let offset = scrollView.contentOffset.y / 180
            if offset > 1 {
                applyBtnConstraint.constant = 0
                scrollView.updateConstraints()
            }else {
                applyBtnConstraint.constant = 60
                scrollView.updateConstraints()
            }
        }
    }
    
    
}


//콜렉션 뷰 Delegate
extension ExhibitApplyVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 135)
    }
    
    
    //하나의 행에 있는 아이템들의 가로간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
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
extension ExhibitApplyVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count =  exhibitApplyList?.artWorkInfo?.count else {
            return 1
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExhibitWorkCell", for: indexPath) as! ExhibitWorkCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        if let collectionImg = exhibitApplyList?.artWorkInfo?[indexPath.row].artImg {
            cell.workImg.imageFromUrl(collectionImg, defaultImgPath: "ggobuk")
            cell.workImg.roundImage(num: 0.08)
            if(indexPath == cvSelectedIndexPath){
                cell.isRadioSelected = true
            }else {
                cell.isRadioSelected = false
            }
            
        }
        
        return cell
    }
}






extension ExhibitApplyVC : UITableViewDelegate {
    
}

extension ExhibitApplyVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = exhibitApplyList?.displayInfo?.count else {
            return 1
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitApplyCell") as! ExhibitApplyCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        
        if let data = exhibitApplyList?.displayInfo?[indexPath.row]{
            var applyStr = ""
            
            if let mainStr = data.exhibitTitle {
                applyStr += mainStr
            }
            if let subStr = data.exhibitSubTitle {
                applyStr += ("-" + subStr)
            }
            
            
            cell.mainLabel.text = applyStr
            
            cell.subLabel.text = data.exhibitApplyText!
            if indexPath == selectedIndexPath {
                cell.isRadioSelected = true
            } else {
                cell.isRadioSelected = false
            }
        }
        
        return cell
    }
    
    
}




extension ExhibitApplyVC {
    func setData(completion: @escaping() -> Void){
        //userIndex값은 로그인할 때 서버에서 줄 것 -> 변경 필요
        ExhibitApplyService.shared.exhibitApply(user_idx: 10) {
            (data) in guard let status = data.status else { return }
            print("\(status)")
            switch status{
            case 200:
                guard let applyData = data.data else { return }
                self.exhibitApplyList = applyData
                completion()
            case 401:
                self.view.makeToast("인증 실패")
            case 500:
                self.view.makeToast("네트워크 오류")
            default:
                print("hi2")
            }
        }
        
    }
    
    @objc func closeApply(){
        dismiss(animated: true)
    }
    
    
    func setDelegate(){
        applyScrollView.delegate = self
        myWorkCV.delegate = self
        myWorkCV.dataSource = self
        
        exhibitTV.delegate = self
        exhibitTV.dataSource = self
    }
    
    
    func setUI(){
        
        //첫번째로 들어오는 정보와 아래 정보들은 모두 일치하기 때문에 헤더의 정보들은 첫번째 아이템으로 함
        guard let firstExhibitInfo = exhibitApplyList?.displayInfo?.first else { return }
        
       
        
        //전시 기간 처리
        var exhibitDateStr = ""
        
        exhibitDateStr += gsno(firstExhibitInfo.startDate)
        exhibitDateStr += ("~" + gsno(firstExhibitInfo.endDate))

        
        dateLabel.text = exhibitDateStr
        
        
        //신청 기간 처리
        var applyDateStr = ""
        
        applyDateStr += gsno(firstExhibitInfo.applyStartDate)
        applyDateStr += ("~" + gsno(firstExhibitInfo.applyEndDate))

        
        deadLineLabel.text = applyDateStr
        
        
        //정보 갱신 (테이블뷰 , 컬렉션뷰)
        exhibitTV.reloadData()
        myWorkCV.reloadData()
        
        
        //내 작품이 없으면 empty뷰가 보이게
        //라디오 버튼과 신청하기 버튼도 막힘(라디오 버튼은 아직 못막음)
        if (exhibitApplyList?.artWorkInfo) != nil {
            workEmptyView.isHidden = true
            applyBtn.setBackgroundColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), forState: .normal)
        }else{
            workEmptyView.isHidden = false
            applyBtn.setBackgroundColor(UIColor(red: 176/255, green: 179/255, blue: 186/255, alpha: 1), forState: .normal)
            applyBtn.isEnabled = false
        }
        
        
        
    }
    
    
}


//라디오 버튼 delegate
extension ExhibitApplyVC : RadioBtnDelegate {
    func cvSelectRadio(at indexPath: IndexPath) {
        cvSelectedIndexPath = indexPath
        myWorkCV.reloadData()
    }
    
    func selectRadioBtn(at indexPath: IndexPath) {
        selectedIndexPath = indexPath
        exhibitTV.reloadData()
    }
}

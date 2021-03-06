

import UIKit

class ExhibitVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var applyExistImg: UIImageView!
    
    
    
    //상단 전시 버튼 -> 클릭시 새 창
    @IBOutlet weak var exhibitBtn: UIButton!
    
    //전시에 대한 전체 데이터(처음에 통으로 다 넘겨줌)
    var exhibitList = [Exhibit]()
    
    
    //신청에서만 쓸 데이터
    var exhibitApplyList = [Exhibit]()
    
    
    //전시 신청 VC
    private lazy var exhibitApplyVC : ExhibitApplyVC = {
        let storyboard = Storyboard.shared().exhibitStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ExhibitApplyVC.reuseIdentifier) as! ExhibitApplyVC
        
        return viewController
    }()
    
    
    //전시 관람VC
    private lazy var exhibitEnterVC : ExhibitEnterVC = {
        let storyboard = Storyboard.shared().exhibitStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ExhibitEnterVC.reuseIdentifier) as! ExhibitEnterVC
        
        return viewController
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        //선택된 셀이 있으면 디셀렉트
        if let index = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: index, animated: true)
        }
        // 스크롤 포지션 되돌리기
        tableView.contentOffset.y = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setData(completion: setUI)
        
    }
    
}

extension ExhibitVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //전시 관람 VC로 이동 - 데이터 전달은 모델보고 변경
        exhibitEnterVC.exhibitEnterData = exhibitList[indexPath.row]
        print("이동이동 \(exhibitList[indexPath.row])")
        navigationController?.pushViewController(exhibitEnterVC, animated: true)
        
    }
}

extension ExhibitVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exhibitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitCell") as! ExhibitCell
        
        let exhibitMainData = exhibitList[indexPath.row]
        
        
        //전시 이미지
        if let exhibitPhotoUrl = exhibitMainData.exhibitImg {
            cell.exhibitImg.imageFromUrl(exhibitPhotoUrl, defaultImgPath: "")
        }
        
        //전시 이름
        let mainText = gsno(exhibitMainData.exhibitTitle)
        cell.exhibitMainLabel.text = mainText.removeNewLine(str: mainText)
        
        //전시 서브 이름
        let subText = gsno(exhibitMainData.exhibitSubTitle)
        cell.exhibitSubLabel.text = subText
        
        //전시 디테일
        let detailText = gsno(exhibitMainData.exhibitEnterText)
        cell.exhibitDetailLabel.text = detailText.removeNewLine(str: detailText)
        
        //라벨 사이즈 오토로
        cell.exhibitMainLabel.sizeToFit()
        cell.exhibitSubLabel.sizeToFit()
        cell.exhibitDetailLabel.sizeToFit()
        return cell
        
    }
    
    
}

extension ExhibitVC {
    
    //전시 신청하는 창 띄우기
    @objc func goApply(){
        present(exhibitApplyVC, animated: true)
    }
    
    
    //데이터 세팅 후 UI변경 (setData의 escaping closure)
    func setUI(){
        
        //데이터 가져온 후 테이블뷰 리로드
        self.tableView.reloadData()
        
        //전시 신청리스트가 0이면 신청시작 없애줌
        if(exhibitList.count == 0){
            applyExistImg.isHidden = true
        }
        
        exhibitBtn.addTarget(self, action: #selector(goApply), for: .touchUpInside)
    }
    
    
    //초기 데이터 세팅
    func setData(completion: @escaping() -> Void){
        ExhibitMainService.shared.exhibitMain { (data) in guard let status = data.status else{ return }
            switch status{
            case 200:
                guard let exhibitData = data.data else { return }
                //전체 전시데이터
                self.exhibitList = exhibitData
                
                print("success")
                completion()
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
    
    func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    
}

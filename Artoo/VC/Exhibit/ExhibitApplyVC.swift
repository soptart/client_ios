//
//  ExhibitApplyVC.swift
//  Artoo
//
//// 전시 신청 창

import UIKit

class ExhibitApplyVC: UIViewController {
    
    
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
    
    //데이터 - 서버 통신 후 변경
    var detailList:ExhibitApplyDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //쓰레기 값
        setData()
        
        //닫기 버튼 누르면 dismiss
        closeBtn.addTarget(self, action: #selector(closeApply), for: .touchUpInside)
        
        //delegate & datasource
        exhibitTV.delegate = self
        exhibitTV.dataSource = self
        
    }
    
    
}


extension ExhibitApplyVC : UITableViewDelegate {
    
}

extension ExhibitApplyVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = detailList?.exhibitInfo.count else {
            return 1
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitApplyCell") as! ExhibitApplyCell
        
        if let data = detailList?.exhibitInfo[indexPath.row]{
            cell.mainLabel.text = data.mainTxt
            cell.subLabel.text = data.subTxt
            
            //라디오 버튼 클릭 이벤트
            cell.radioBtn.tag = indexPath.row
            cell.radioBtn.addTarget(self, action: #selector(selectExhibit), for: .touchUpInside)
        }
        
        return cell
    }
    
    
}




extension ExhibitApplyVC {
    func setData(){
        detailList = ExhibitApplyDetail(
            exhibitInfo: [ExhibitDetailInfo(mainTxt: "익숙함이 새로웠던 전 - 일상편", subTxt: "허전했던 벽에 걸어보자", exhibitDate: "2019.0.2~2019.0.4", applyDate: "2019.0.2~2019.0.4" , workNum: "1인 1작품 제한", personNum: "30명"),
                          ExhibitDetailInfo(mainTxt: "익숙함이 새로웠던 전 - 자유편", subTxt: "허전했던 벽에 걸어보자", exhibitDate: "2019.0.2~2019.0.5", applyDate: "2019.0.2~2019.0.5" , workNum: "1인 2작품 제한", personNum: "40명"),
                          ExhibitDetailInfo(mainTxt: "익숙함이 새로웠던 전 - 치유편", subTxt: "허전했던 벽에 걸어보자", exhibitDate: "2019.0.2~2019.0.6", applyDate: "2019.0.2~2019.0.6" , workNum: "1인 13작품 제한", personNum: "50명"),
                          ], myWork: ["ggobuk", "fire",
                                      "jiu", "meta",
                                      "ggobuk", "fire",
                                      "jiu", "meta",
                                      "ggobuk", "fire",
                                      "jiu", "meta"])
    }
    
    @objc func closeApply(){
        dismiss(animated: true)
    }
    
    //전시 라디오 버튼 클릭시 이미지 변경과 처리들
    @objc func selectExhibit(sender: UIButton){
        switch sender.tag {
        case 0:
            sender.setImage(UIImage(named: "ggobuk"), for: UIControl.State.normal)
        case 1:
            sender.setImage(UIImage(named: "ggobuk"), for: UIControl.State.normal)
        case 2:
            sender.setImage(UIImage(named: "ggobuk"), for: UIControl.State.normal)
        default:
            print("hi")
        }
        

    }
    
    
}

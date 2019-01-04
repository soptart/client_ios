//
//  ExhibitVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 25..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //상단 전시설명 라벨
    @IBOutlet weak var exhibitLabel: UILabel!
    
    //상단 전시 날짜
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var applyView: UIView!
    
    //상단 전시 버튼 -> 클릭시 새 창
    @IBOutlet weak var exhibitBtn: UIButton!
    
    //전시에 대한 전체 데이터(처음에 통으로 다 넘겨줌)
    var exhibitList = [Exhibit]()
    
    //메인에서만 쓸 데이터
    var exhibitMainList = [Exhibit]()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setData(completion: setUI)
    }
    
}

extension ExhibitVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //전시 관람 VC로 이동 - 데이터 전달은 모델보고 변경
        navigationController?.pushViewController(exhibitEnterVC, animated: true)
        
    }
}

extension ExhibitVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //메인화면에서만 쓸 데이터의 카운트를 리턴함
        return exhibitMainList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitCell") as! ExhibitCell
        
        let exhibitMainData = exhibitMainList[indexPath.row]
        print("\(exhibitMainData)")
        
        if let exhibitPhotoUrl = exhibitMainData.exhibitImg {
            cell.exhibitImg.imageFromUrl(exhibitPhotoUrl, defaultImgPath: "ggobuk")
        }
        
        if let intro = exhibitMainData.exhibitEnterText {
            cell.exhibitIntroLabel.text = intro
        }
        
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
        
        //전시 신청리스트가 0이면 신청버튼없애줌
        if(exhibitApplyList.count == 0){
            applyView.isHidden = true
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
                
                //메인화면에서만 쓸 전시데이터
                self.exhibitMainList =  self.exhibitList.filter{ $0.isNowExhibit == 1}
                
                //전시신청에서 쓸 전시데이터
                self.exhibitApplyList = self.exhibitList.filter{ $0.isNowExhibit == 0}
                
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

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
    
    //상단 전시 버튼 -> 클릭시 새 창
    @IBOutlet weak var exhibitBtn: UIButton!
    
    //쓰레기 데이터
    var exhibitList: Exhibit?
    
    //전시 신청 VC
    private lazy var exhibitApplyVC : ExhibitApplyVC = {
        let storyboard = Storyboard.shared().exhibitStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ExhibitApplyVC.reuseIdentifier) as! ExhibitApplyVC
        
        return viewController
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        exhibitBtn.addTarget(self, action: #selector(goApply), for: .touchUpInside)
    }
    
}

extension ExhibitVC : UITableViewDelegate {
    
}

extension ExhibitVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section =  exhibitList?.exhibit.count else {
            return 1
        }
        
        return section
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitCell") as! ExhibitCell
        if let data = exhibitList?.exhibit[indexPath.row] {
            cell.exhibitImg.image = UIImage(named: data.exhibitImg)
        }
        return cell

    }
    
    
}

extension ExhibitVC {

    //전시 신청하는 창 띄우기
    @objc func goApply(){
        present(exhibitApplyVC, animated: true)
    }
    
    //초기 데이터 세팅
    func setData(){
        exhibitList = Exhibit(apply: ExhibitApply(applyStr:"11월의 단체전시 신청시작!\n[익숙함이 새로웠 던 전]-일상편", applyDate: "2019.1.2 ~ 2019.2.3", applyImg: "fire"), exhibit: [ExhibitSee(exhibitIndex: 0, exhibitImg: "exhibit"),
                                                                                                                                                                                                ExhibitSee(exhibitIndex: 1, exhibitImg: "exhibit"),
                                                                                                                                                                                                      ExhibitSee(exhibitIndex: 2, exhibitImg: "exhibit"),
                                                                                                                                                                                                      ExhibitSee(exhibitIndex: 3, exhibitImg: "exhibit"),
                                                                                                                                                                                                      ExhibitSee(exhibitIndex: 4, exhibitImg: "exhibit")
                                                                                    ])
        
        if let initData = exhibitList?.apply {
            exhibitLabel.text = initData.applyStr
            dateLabel.text = initData.applyDate
            exhibitBtn.setImage(UIImage(named: initData.applyImg), for: UIControl.State.normal)
        }
    
    }
    
    
}

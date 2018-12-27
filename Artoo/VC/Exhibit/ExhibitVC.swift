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
    var exhibitList: [Exhibit] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setData()
    }
    
}

extension ExhibitVC : UITableViewDelegate {
    
}

extension ExhibitVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section =  exhibitList.first?.exhibitImg.count else {
            return 1
        }
        
        return section
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitCell") as! ExhibitCell
        if let data = exhibitList.first?.exhibitImg[indexPath.row] {
            cell.exhibitImg.image = UIImage(named: data)
        } else {
            //전시이미지가 없을 시에 이미지
            cell.exhibitImg.image = UIImage(named: "ggobuk")}
        return cell

    }
    
    
}

extension ExhibitVC {
    
    //초기 데이터 세팅
    func setData(){
        exhibitList.append(Exhibit(exhibitText: "11월의 단체전시 신청시작! \n[익숙함이 새로웠던 전] - 일상편", exhibitDate: "2019.1.2~2019.2.3", exhibitImg:["exhibit","exhibit","exhibit","exhibit"]))
        
        if let initData = exhibitList.first {
            exhibitLabel.text = initData.exhibitText
            dateLabel.text = initData.exhibitDate
        }else {
            exhibitLabel.text = "전시 이름"
            dateLabel.text = "전시 날짜"
        }
    }
    
    
    
    
}

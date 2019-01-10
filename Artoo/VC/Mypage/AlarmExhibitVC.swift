//
//  exhibitListVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class AlarmExhibitVC: UIViewController {

    var exhibitList: [ExhibitAlarm] = []
    
    @IBOutlet var exhibitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData(completion: setUI)
    }


    @IBAction func cancelBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "exhibitCancelSegue", sender: self)
    }
}

extension AlarmExhibitVC : UITableViewDelegate {
    
}
extension AlarmExhibitVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //전체 데이터
        let data = exhibitList[indexPath.row]
        
        //전시에 대한 세부적인 데이터
        let displayData = data.display!

        let cell = exhibitTableView.dequeueReusableCell(withIdentifier: "AlarmExhibitCell") as! AlarmExhibitCell
        cell.dateLabel.text = gsno(data.dcDate)
        cell.exhibitNameLabel.text = gsno(displayData.exhibitTitle)
        cell.exhibitDateLabel.text = gsno(displayData.startDate) + "~" + gsno(displayData.endDate)
        cell.authorNameLabel.text = gsno(data.uName)
        cell.authorWorkLabel.text = gsno(data.aName)
        return cell
        
    }
    
}


extension AlarmExhibitVC{
    
    
    func setUI(){
        exhibitTableView.delegate = self
        exhibitTableView.dataSource = self
    }
    
    
    func setData(completion: @escaping() -> Void){
        let userIndex = UserDefaults.standard.integer(forKey: "userIndex")
        
        AlarmExhibitService.shared.getExhibitList(user_idx: userIndex) { (data) in guard let status = data.status else{ return }
            print("\(status)")
            switch status{
            case 200:
                guard let exhibitData = data.data else { return }
                self.exhibitList = exhibitData
                print("\(self.exhibitList)")
                print("success")
                completion()
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
    
    
}

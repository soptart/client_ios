//
//  SettingMainVC.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class SettingMainVC: UIViewController {

    
    @IBOutlet weak var settingTable: UITableView!
    
    var settings: [Setting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        // Do any additional setup after loading the view.
        settingTable.dataSource = self
    }
    
}

extension SettingMainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingTable.dequeueReusableCell(withIdentifier: "settingMain") as! SettingMainCell
        
        
        let setting = settings[indexPath.row]
        
        cell.myInfoImg.image = UIImage(named: setting.settingImg)
        cell.settingMoveItem.text = setting.settingTitle
        
        return cell
        
    }
    
    
}

extension SettingMainVC{
    
    func setData(){
        let settingInfo1 = Setting(settingImg:"settingMy", settingTitle:"내 정보")
        
        let settingInfo2 = Setting(settingImg:"settingQna", settingTitle:"자주 묻는 질문")
        
        let settingInfo3 = Setting(settingImg:"settingService", settingTitle:"서비스 이용약관")
        
        let settingInfo4 = Setting(settingImg:"settingPrivacy", settingTitle:"개인정보 보호정책")
        
        settings=[settingInfo1,settingInfo2,settingInfo3,settingInfo4]
    }
}

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
        settingTable.delegate = self
    }
    
}

extension SettingMainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let headerHeight: CGFloat
        
        switch section {
        case 0:
            headerHeight = CGFloat.leastNonzeroMagnitude
        default:
            headerHeight = 10
        }
        
        return headerHeight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        switch  row {
        case 0:
            guard let MyInfoPage = storyboard?.instantiateViewController(withIdentifier: "MyInfo") as? MyInfoVC else { return }
            
            navigationController?.pushViewController(MyInfoPage, animated: true)
            
        case 1:
            guard let QnaPage = storyboard?.instantiateViewController(withIdentifier: "Qna") as? QnaVC else { return }
            
            navigationController?.pushViewController(QnaPage, animated: true)
            
        case 2:
            guard let ServicePage = storyboard?.instantiateViewController(withIdentifier: "Using") as? UsingVC else { return }
            
            navigationController?.pushViewController(ServicePage, animated: true)
            
        case 3:
            guard let PrivacyPage = storyboard?.instantiateViewController(withIdentifier: "Protection") as? ProtectionVC else { return }
            
            navigationController?.pushViewController(PrivacyPage, animated: true)
        default: print("")
            
        }
    }
}

extension SettingMainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return settings.count}
        else{
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingTable.dequeueReusableCell(withIdentifier: "settingMain") as! SettingMainCell
        
        if(indexPath.section == 0){
        let setting = settings[indexPath.row]
        
        cell.myInfoImg.image = UIImage(named: setting.settingImg)
        cell.settingMoveItem.text = setting.settingTitle
        
        return cell
        }else {
            cell.myInfoImg.image = UIImage(named: "exhibitionExit")
            cell.settingMoveItem.text = "로그아웃"
            return cell
        }
        
  
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

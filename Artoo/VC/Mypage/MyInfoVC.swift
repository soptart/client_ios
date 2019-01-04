//
//  MyInfoVC.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class MyInfoVC: UIViewController {

    var myInformation: [MyInfo] = []
    
    @IBOutlet weak var myInfoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myInfoTable.dataSource = self
        
        setData()
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        
        guard let logVC = storyboard?.instantiateViewController(withIdentifier: "Logout") as? LogoutVC else { return }
        
        navigationController?.pushViewController(logVC, animated: true)
    }
    
    
}

extension MyInfoVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myInfoTable.dequeueReusableCell(withIdentifier: "MyInfo") as! MyInfoCell
        
        
        let info = myInformation[indexPath.row]
        
        cell.MyInfoTitle.text = info.InfoTitle
        cell.MyInfoData.text = info.InfoData
        
        return cell
        
    }
    
    
}

extension MyInfoVC{
    func setData(){
        let name = MyInfo(InfoTitle: "이름", InfoData: "김보윤")
        let email = MyInfo(InfoTitle: "이메일", InfoData: "bykim92@jjj")
        
        let pwd = MyInfo(InfoTitle: "비밀번호", InfoData: "1234")
        
        let number = MyInfo(InfoTitle: "연락처", InfoData: "김보윤")
        
        let address = MyInfo(InfoTitle: "주소", InfoData: "서울시 용산구")
        
        let univ = MyInfo(InfoTitle: "대학교", InfoData: "덕성여대")
        
        let bank = MyInfo(InfoTitle: "은행", InfoData: "신한은행")
        
        let account = MyInfo(InfoTitle: "계좌 번호", InfoData: "000-333-3333")
        
        myInformation = [name,email,pwd,number,address,univ,bank,account]
    }
}

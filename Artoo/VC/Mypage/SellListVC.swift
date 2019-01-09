//
//  SellListVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//// 구매내역 VC

import UIKit

class SellListVC: UIViewController {
    
    @IBOutlet var SellTable: UITableView!
    
    var buyList: [BuyInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(completion: setUI)
      //  SellTable.dataSource = self
    }
    
    //환불버튼 눌렀을 때
    
    @IBAction func refundBtn(_ sender: UIButton) {
        if(sender.tag == 0){
            performSegue(withIdentifier: "firstCellRefundSegue", sender: self)
        } else {
            performSegue(withIdentifier: "secondCellRefundSegue", sender: self)
        }
        
        
        
    }
    
    //리뷰버튼 눌렀을 때
    @IBAction func reviewBtn(_ sender: UIButton) {
        
        if(sender.tag == 0){
            performSegue(withIdentifier: "firstCellRiviewSegue", sender: self)
        } else {
            performSegue(withIdentifier: "secondCellRiviewSegue", sender: self)
            
        }
        
    }
    
    
}

extension SellListVC {
    func setUI(){
        
    }
    
    
    func setData(completion: @escaping() -> Void){
        let userIndex = UserDefaults.standard.integer(forKey: "userIndex")
        
        AlarmBuyService.shared.getBuyList(user_idx: userIndex) { (data) in guard let status = data.status else{ return }
            print("\(status)")
            switch status{
            case 200:
                guard let buyData = data.data else { return }
                self.buyList = buyData
                print("\(self.buyList)")
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
//
//extension SellListVC: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//
//        return buyInformation.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = SellTable.dequeueReusableCell(withIdentifier: "first") as! sellFirstCell
//
//        let cell2 = SellTable.dequeueReusableCell(withIdentifier: "second") as! sellSecondCell
//
//
//        let buy = buyInformation[indexPath.row]
//
//        //서버 정보로 바꿔줘야 함
//        if buy.isDelivery == 0 {
//
//            cell.sellImg.image = UIImage(named: buy.artImg)
//            cell.buyItem.text = buy.artName
//            cell.buyItemAuthor.text = buy.artAuthor
//            cell.transaction.text = "직거래"
//
//
//            return cell
//        } else {
//
//            cell2.sellImg.image = UIImage(named: buy.artImg)
//            cell2.buyItem.text = buy.artName
//            cell2.buyItemAuthor.text = buy.artAuthor
//            cell2.transaction.text = "택배"
//
//            return cell2
//        }
//
//    }
//
//}




//
//  SellListVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class SellListVC: UIViewController {
    
    @IBOutlet var SellTable: UITableView!
    
    var buyInformation: [buyInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpData()
        
        SellTable.dataSource = self
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
    
    
    func setUpData(){
        let buyitem1 = buyInfo(state: 0, isDelivery: 0, date: "2015-3-2", artName: "7살 어딘가", artAuthor: "배선영", sellerName:"김보윤", sellerPhone: "010-3333-3333", sellerAddress: "서울시 용산구", artImg: "01")
        
        let buyitem2 = buyInfo(state: 1, isDelivery: 1, date: "2015-3-4", artName: "지금 이순간", artAuthor: "최윤정", sellerName:"김보윤", sellerPhone: "010-3243-3333", sellerAddress: "서울시 금호동", artImg: "02")
        
        buyInformation = [buyitem1, buyitem2]
    }
 
    
}

extension SellListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return buyInformation.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           let cell = SellTable.dequeueReusableCell(withIdentifier: "first") as! sellFirstCell
        
           let cell2 = SellTable.dequeueReusableCell(withIdentifier: "second") as! sellSecondCell
        
        
        let buy = buyInformation[indexPath.row]
        
        //서버 정보로 바꿔줘야 함
        if buy.isDelivery == 0 {
            
            cell.sellImg.image = UIImage(named: buy.artImg)
            cell.buyItem.text = buy.artName
            cell.buyItemAuthor.text = buy.artAuthor
            cell.transaction.text = "직거래"
  
            
            return cell
        } else {
            
            cell2.sellImg.image = UIImage(named: buy.artImg)
            cell2.buyItem.text = buy.artName
            cell2.buyItemAuthor.text = buy.artAuthor
            cell2.transaction.text = "택배"
            
            return cell2
        }
        
    }
    
}




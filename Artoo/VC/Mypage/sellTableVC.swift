//
//  sellTableVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class sellTableVC: UITableViewController {
    
    var sellInformation: [saleInfo] = []
    
    
    @IBOutlet var sellInfoTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sellInformation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell1 = sellInfoTable.dequeueReusableCell(withIdentifier: "directTransaction") as! sellTableFstCell
        
        
        let cell2 = sellInfoTable.dequeueReusableCell(withIdentifier: "deliveryTransaction") as! sellTableSecondCell
        
        print(indexPath.row)
        let sell = sellInformation[indexPath.row]
        
        if sell.isDelivery == 0 {
            
            cell1.sellItemImg.image = UIImage(named: sell.artImg)
            cell1.sellItemName.text = sell.artName
            cell1.sellItemAuthor.text = sell.artAuthor
            cell1.sellItemTransaction.text = "직거래"
            cell1.buyerName.text = sell.buyerName
            cell1.buyerNumber.text = sell.buyerPhone
            cell1.buyerAddress.text = sell.buyerAddress
            
            return cell1
        } else {
            
            cell2.transactionItemImg.image = UIImage(named: sell.artImg)
            cell2.transactionCounterItem.text = sell.artName
            cell2.transactionCounterItemAuthor.text = sell.artAuthor
            cell2.transactionMethod.text = "택배"
            cell2.transactionCounterName.text = sell.buyerName
            cell2.transactionCounterNumber.text = sell.buyerPhone
            cell2.transactionCounterAddress.text = sell.buyerAddress
            
            return cell2
        }
        }
    
    //거래 취소하기 버튼 눌렀다면
    @IBAction func cancelBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "transactionCancelSegue", sender: self)
    }
    
    
    }

extension sellTableVC{
    
    func setData(){
        let sellitem1 = saleInfo(state: 0, isDelivery: 0, date: "2015-3-2", artName: "7살 어딘가", artAuthor: "배선영", buyerName:"홍정민", buyerPhone: "010-3333-2345", buyerAddress: "서울시 강북구", artImg: "01")
        
        let sellitem2 = saleInfo(state: 1, isDelivery: 1, date: "2015-3-9", artName: "지금 이순간", artAuthor: "최윤영", buyerName:"홍정수", buyerPhone: "010-3333-2345", buyerAddress: "서울시 강북구 삼성레미안아파트 120동", artImg: "02")
       
        
        sellInformation = [sellitem1, sellitem2]
    }
    
}

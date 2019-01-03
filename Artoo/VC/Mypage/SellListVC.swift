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
    
    var buyItems: [BuyItemInfo] = []
    var sellers: [sellerInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBuyItem()
        setSeller()
       
        SellTable.dataSource = self
    }
    
}

extension SellListVC {
    
    func setBuyItem(){
        let buyitem1 = BuyItemInfo(buyItemName: "7살과 그녀", buyItemAuthor: "최윤정", transactionMethod: "직거래", buyItemImg: "01")
        
        let buyItem2 = BuyItemInfo(buyItemName: "02", buyItemAuthor: "배선영", transactionMethod: "직거래", buyItemImg: "02")
        
        buyItems = [buyitem1, buyItem2]
        
    }
    
    func setSeller(){
        let seller1 = sellerInfo(sellerName: "최윤정", sellerPhone: "010-3111-0988", sellerAddr: "서울시 노원구")

        sellers = [seller1]
    }
    
}

extension SellListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return buyItems.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           let cell = SellTable.dequeueReusableCell(withIdentifier: "first") as! sellFirstCell
        
           let cell2 = SellTable.dequeueReusableCell(withIdentifier: "second") as! sellSecondCell
        
        let buy = buyItems[indexPath.row]
        let sell = sellers[indexPath.row]
        
        cell.sellImg.image = UIImage(named: buy.buyItemImg)
        cell.buyItem.text = buy.buyItemName
        cell.buyItemAuthor.text = buy.buyItemAuthor
        cell.transaction.text = buy.transactionMethod
        cell.seller.text = sell.sellerName
        cell.sellerNumber.text = sell.sellerPhone
        cell.sellerAddress.text = sell.sellerAddr
        
        cell2.sellImg.image = UIImage(named: buy.buyItemImg)
        cell2.buyItem.text = buy.buyItemName
        cell2.buyItemAuthor.text = buy.buyItemAuthor
        cell2.transaction.text = buy.transactionMethod
        
        if buy.transactionMethod == "직거래" {
            
            return cell2
        } else {
            return cell
        }
        
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



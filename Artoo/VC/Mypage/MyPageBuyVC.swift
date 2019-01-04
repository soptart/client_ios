//
//  MyPageBuyVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageBuyVC: UIViewController {

    @IBOutlet weak var BuyTable: UITableView!
    
    var buyList: [BuyItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBuyItem()
        
        BuyTable.dataSource = self

        // Do any additional setup after loading the view.
    }

}

extension MyPageBuyVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = BuyTable.dequeueReusableCell(withIdentifier: "all_buyItem") as! BuyItemCell
        
        print(indexPath.row)
        let buy = buyList[indexPath.row]
        
        cell.artImg.image = buy.artImg
        cell.artItem.text = buy.artItem
        cell.buyer.text = buy.buyer
        cell.price.text = buy.price
        cell.date.text = buy.date
        
        return cell
    }
    
}

extension MyPageBuyVC {
    func setBuyItem(){
        let item1 = BuyItem(artName: "01", artItem: "7살", buyer: "배선영", price: "25,000", date: "2018.03.05")
         let item2 = BuyItem(artName: "02", artItem: "그곳 어딘가", buyer: "최윤정", price: "120,000", date: "2018.03.09")
        let item3 = BuyItem(artName: "03", artItem: "겨울", buyer: "윤여진", price: "120,00", date: "2018.03.11")
        buyList = [item1,item2,item3]
    }
}

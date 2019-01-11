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
    
    var buyInfo: [MyPurchase]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(completion: setUI)
        
    }

}

extension MyPageBuyVC: UITableViewDelegate {
    
}

extension MyPageBuyVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = buyInfo?.count else { return 1 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = BuyTable.dequeueReusableCell(withIdentifier: "all_buyItem") as! BuyItemCell
        
        guard let data = buyInfo?[indexPath.row] else { return UITableViewCell() }
        
        cell.artImg.imageFromUrl(gsno(data.aPicUrl), defaultImgPath: "")
        cell.artImg.roundImage(num: 0.08)
        
        cell.artItem.text = gsno(data.aName)
        
        if let isBuyer = data.buyer {
            if(isBuyer){
                cell.isBuyerLabel.text = "판매자:"
                cell.buyer.text = gsno(data.uName)
                cell.buyImg.image = UIImage(named:"mypageSell")
            }else {
                cell.isBuyerLabel.text = "구매자:"
                cell.buyer.text = gsno(data.uName)
                cell.buyImg.image = UIImage(named:"mypagePay")
            }
        }
        
        cell.price.text = "\(gino(data.aPrice))원"
        cell.date.text = gsno(data.pDate)
        
        return cell
    }
    
}


extension MyPageBuyVC {
    func setUI(){
        BuyTable.reloadData()
        BuyTable.dataSource = self
        BuyTable.delegate = self
    }
    
    func setData(completion: @escaping() -> Void){
        let userIdx = UserDefaults.standard.integer(forKey: "userIndex")
        print("\(userIdx)")
        MyPageBuyService.shared.getBuyList(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 200:
                guard let buyData = data.data else { return }
                self.buyInfo = buyData
                print("\(buyData)")
                completion()
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
}

//
//  SellListVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//// 구매내역 VC

import UIKit

class SellListVC: UIViewController {
    
    @IBOutlet weak var sellTableView: UITableView!
    
    var buyList: [BuyInfo] = [] //서버에서 받아오는 구매 내역
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(completion: setUI)
        
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


extension SellListVC : UITableViewDelegate {
    
}

extension SellListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //결제 완료 - 택배(1 / 1)
        let data = buyList[indexPath.row]
        let isPay = gino(data.pIsPay)
        let isDelivery = gino(data.pIsDelivery)
        
        if(isPay == 1 && isDelivery == 1){
            let cell = sellTableView.dequeueReusableCell(withIdentifier: "first") as! sellFirstCell
            cell.dateLabel.text = gsno(data.pDate)
            cell.workImageView.imageFromUrl(gsno(data.aPicUrl), defaultImgPath: "")
            cell.workNameLabel.text = gsno(data.aName)
            cell.authorNameLabel.text = gsno(data.auName)
            cell.tTypeLabel.text = "택배"
            cell.sellerNameLabel.text = gsno(data.uName)
            cell.sellerPhoneLabel.text = gsno(data.uPhone)
            cell.sellerAdressLabel.text = gsno(data.uAdress)
            return cell
        } else if(isPay == 1 && isDelivery == 0){
            //결제 완료 - 직거래(1 / 0)
            let cell = sellTableView.dequeueReusableCell(withIdentifier: "second") as! sellSecondCell
            cell.dateLabel.text = gsno(data.pDate)
            cell.sellImg.imageFromUrl(gsno(data.aPicUrl), defaultImgPath: "")
            cell.buyItem.text = gsno(data.aName)
            cell.buyItemAuthor.text = gsno(data.auName)
            cell.transaction.text = "직거래"
            return cell
        }else {
            //결제 미완료
            let cell = sellTableView.dequeueReusableCell(withIdentifier: "SellThirdCell") as! SellThirdCell
            cell.dateLabel.text = gsno(data.pDate)
            cell.artImgView.imageFromUrl(gsno(data.aPicUrl), defaultImgPath: "")
            cell.workNameLabel.text = gsno(data.aName)
            cell.authorNameLabel.text = gsno(data.auName)

        
            let tType = gino(data.pIsDelivery)
            if(tType == 0){
                cell.typeLabel.text = "직거래"
            }else {
                cell.typeLabel.text = "택배"
            }
            
            cell.moneyLabel.text = "\(gino(data.aPrice))"
            cell.accountLabel.text = gsno(data.uBank) + " " + gsno(data.uAccount) + " " + gsno(data.uName)
            return cell
        }
        
        
        
    }
    
    
    
}


extension SellListVC {
    func setUI(){
        sellTableView.delegate = self
        sellTableView.dataSource = self
        sellTableView.reloadData()
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





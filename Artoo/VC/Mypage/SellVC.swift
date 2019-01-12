
////판매 내역 VC

import UIKit

class SellVC: UIViewController {
    
    //서버 통신해서 받아올 판매 정보
    var sellList: [BuyInfo] = []
    
    //테이블 뷰
    @IBOutlet var sellTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(completion: setUI)
    }
    
    
    
}


extension SellVC : UITableViewDelegate {}

extension SellVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = sellList[indexPath.row]
        let isDelivery = gino(data.pIsDelivery)
        
        let cell = sellTableView.dequeueReusableCell(withIdentifier: "SellCell") as! SellCell
        
        //배경 이미지 처리
        cell.backImg.layer.borderColor = UIColor(red: 236/255, green: 239/255, blue: 243/255, alpha: 1.0).cgColor
        cell.backImg.layer.borderWidth = 1

        cell.dateLabel.text = gsno(data.pDate)
        cell.workImageView.imageFromUrl(gsno(data.aPicUrl), defaultImgPath: "")
        cell.workNameLabel.text = gsno(data.aName)
        cell.workNameLabel.sizeToFit()
        cell.workAuthorLabel.text = gsno(data.auName)
        
        if(isDelivery == 0) {
            //직거래
            cell.deliveryLabel.text = "직거래"
        }else {
            cell.deliveryLabel.text = "택배"
        }
        
        cell.sellerNameLabel.text = gsno(data.uName)
        cell.sellerPhoneLabel.text = gsno(data.uPhone)
        cell.sellerAdressLabel.text = gsno(data.uAdress)
        
        return cell
    }
    
    
    
}



extension SellVC {
    func setUI(){
        sellTableView.delegate = self
        sellTableView.dataSource = self
    }
    
    func setData(completion: @escaping() -> Void){
        let userIndex = UserDefaults.standard.integer(forKey: "userIndex")
        
        AlarmSellService.shared.getSellList(user_idx: userIndex) { (data) in guard let status = data.status else{ return }
            print("\(status)")
            switch status{
            case 200:
                guard let sellData = data.data else { return }
                self.sellList = sellData
                print("\(self.sellList)")
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

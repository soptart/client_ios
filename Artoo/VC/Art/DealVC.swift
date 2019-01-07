//
//  DealVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class DealVC: UIViewController {

    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var directBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var buyImage: UIImageView!
    @IBOutlet weak var buyItemNameLabel: UILabel!
    @IBOutlet weak var buyItemPriceLabel: UILabel!
    @IBOutlet weak var buyItemPriceLabel2: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    
    var buyImageUrl: String!
    var buyItemName: String!
    var buyPrice: Int!
    var totalPrice: Int? //나중에 계산해주기.
    var isDelivery: Bool? //택배면 true, 직거래면 false
    var sendArtIndex: Int?
    var sendUserIndex: Int?
    var takerName: String?
    var takerAddress: String?
    var takerPhone: String?
    var isPayment: Int?
    
    //택배나 직거래 버튼 눌렀을 때 화면이 변하기
    @IBAction func changeView(_ sender: UIButton) {
        updateView(selected: sender.tag)
        if sender.tag == 0 {
            deliveryBtn.setBackgroundColor(UIColor(displayP3Red: 255/255, green: 111/255, blue: 97/255, alpha: 1), forState: .normal)
           deliveryBtn.setTitleColor(UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            directBtn.setBackgroundColor(UIColor(displayP3Red: 236/255, green: 239/255, blue: 243/255, alpha: 1), forState: .normal)
            directBtn.setTitleColor(UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1), for: .normal)
            
            isDelivery = true
            noticeLabel.isHidden = false
        } else {
                directBtn.setBackgroundColor(UIColor(displayP3Red: 255/255, green: 111/255, blue: 97/255, alpha: 1), forState: .normal)
            directBtn.setTitleColor(UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            deliveryBtn.setBackgroundColor(UIColor(displayP3Red: 236/255, green: 239/255, blue: 243/255, alpha: 1), forState: .normal)
            deliveryBtn.setTitleColor(UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1), for: .normal)
            
            isDelivery = false
            noticeLabel.isHidden = true
            }

    }
    
    private lazy var deliveryService : DeliveryVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "delivery") as! DeliveryVC
        
        self.add(asChildViewConroller: viewController)
        
        return viewController
    }()
    
    private lazy var directService: DirectVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "direct") as! DirectVC
        
        self.add(asChildViewConroller: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(selected: 0)
        // Do any additional setup after loading the view.
        buyImage.imageFromUrl(gsno(buyImageUrl!), defaultImgPath: "ggobuk")
        buyItemNameLabel.text = buyItemName!
        buyItemPriceLabel.text = String(describing: buyPrice!)
        buyItemPriceLabel2.text = String(describing: buyPrice!)
        
    }
    
    
    @IBAction func dealBtn(_ sender: Any) {
        takerName = deliveryService.takerNameLabel.text!
        takerAddress = deliveryService.takerAddressLabel.text!
        takerPhone = deliveryService.takerPhoneLabel.text!
        
        sendTakerInfo()
        isPayment = 1
    }
    
}

//DealVC의 확장 기능
extension DealVC {
    
    private func add(asChildViewConroller viewController: UIViewController) {
        
        addChild(viewController)
        containerView.addSubview(viewController.view)
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func updateView(selected: Int){
        if selected == 0{
            remove(asChildViewController: directService)
            add(asChildViewConroller: deliveryService)
            
        } else {
            remove(asChildViewController: deliveryService)
            add(asChildViewConroller: directService)
        }
    }
    
    func sendTakerInfo(){

        print("\(isDelivery)")
        CheckBuyItemService.shared.buy(art_index: sendArtIndex!, user_index: sendUserIndex!, delivery: isDelivery!, buyerName: takerName!, buyerAddress: takerAddress!, buyerPhone: takerPhone!, Payment: 1){
            (data) in guard let status = data.status else { return }
            
            print("나는 천재다")
            print(status)
            
            switch status{
            case 200:
                self.view.makeToast("구매 저장 정보 성공")
            case 204:
                self.view.makeToast("구매 항목 미기입")
            case 600:
                self.view.makeToast("데이터베이스 에러")
            case 500:
                self.view.makeToast("서버 내부 에러")
            default: print("hihih")
            }
        }
}
}


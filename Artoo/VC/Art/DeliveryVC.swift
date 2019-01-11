//
//  DeliveryVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class DeliveryVC: UIViewController {

    @IBOutlet weak var takerNameLabel: UITextField!
    @IBOutlet weak var takerAddressLabel: UITextField!
    @IBOutlet weak var takerDetailAddrssLabel: UITextField!
    @IBOutlet weak var takerPhoneLabel: UITextField!
    @IBOutlet weak var accountMethodBtn: UIButton!
    @IBOutlet weak var cardMethodBtn: UIButton!
    
//    var takerName: String?
//    var takerAddress: String?
//    var takerPhone: String?
    var isDelivery: Bool?
//    var sendArtIndex: Int?
//    var sendUserIndex: Int?
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        isDelivery = true
        
        guard let deal = storyboard?.instantiateViewController(withIdentifier: "deal") as? DealVC else { return }
        
        
//        takerName = takerNameLabel.text!
//        takerAddress = takerAddressLabel.text!
//        takerPhone = takerPhoneLabel.text!
    }
    
    private lazy var creditService : CreditVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "delivery") as! CreditVC
        
        self.add(asChildViewConroller: viewController)
        
        return viewController
    }()
    
    private lazy var accountService: AccountVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "direct") as! AccountVC
        
        self.add(asChildViewConroller: viewController)
        
        return viewController
    }()

    @IBAction func choiceCheckMethodBtn(_ sender: UIButton) {
        if sender.tag == 0 {
            cardMethodBtn.setBackgroundColor(UIColor(displayP3Red: 255/255, green: 111/255, blue: 97/255, alpha: 1), forState: .normal)
            cardMethodBtn.setTitleColor(UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            accountMethodBtn.setBackgroundColor(UIColor(displayP3Red: 236/255, green: 239/255, blue: 243/255, alpha: 1), forState: .normal)
            accountMethodBtn.setTitleColor(UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1), for: .normal)
            
        } else {
            accountMethodBtn.setBackgroundColor(UIColor(displayP3Red: 255/255, green: 111/255, blue: 97/255, alpha: 1), forState: .normal)
            accountMethodBtn.setTitleColor(UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            cardMethodBtn.setBackgroundColor(UIColor(displayP3Red: 236/255, green: 239/255, blue: 243/255, alpha: 1), forState: .normal)
            cardMethodBtn.setTitleColor(UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1), for: .normal)
            
        }
        
    }
    
    
    
}

extension DeliveryVC{
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
            remove(asChildViewController: accountService)
            add(asChildViewConroller: creditService)
            
        } else {
            remove(asChildViewController: creditService)
            add(asChildViewConroller: accountService)
        }
    }
}



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
    
    //택배나 직거래 버튼 눌렀을 때 화면이 변하기
    @IBAction func changeView(_ sender: UIButton) {
        updateView(selected: sender.tag)
        if sender.tag == 0 {
            deliveryBtn.setImage(UIImage(named: "fire"), for: .normal)
            directBtn.setImage(UIImage(named: "ggobuk"), for: .normal)
            noticeLabel.isHidden = false
        } else {
                deliveryBtn.setImage(UIImage(named: "ggobuk"), for: .normal)
                directBtn.setImage(UIImage(named: "fire"), for: .normal)
            
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
}

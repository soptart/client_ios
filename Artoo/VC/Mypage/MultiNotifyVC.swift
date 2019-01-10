//
//  MultiNotifyVC.swift
//  Artoo
//
//  Created by 보윤 on 02/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class MultiNotifyVC: UIViewController {
    
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    //탭 버튼 3개
    @IBOutlet weak var buyListBtn: UIButton! //구매내역
    @IBOutlet weak var sellListBtn: UIButton! //판매내역
    @IBOutlet weak var exhibitListBtn: UIButton! //전시내역
    
   //컨테이너 뷰(내용이 변함)
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(selected: 0)
        secondImg.isHidden = true
        thirdImg.isHidden = true
        backBtn.addTarget(self, action: #selector(backMyPage), for: .touchUpInside)
    }
    
    
    //버튼 눌러서 아래 컨테이너가 변하는 액션
    @IBAction func ChangeTapBtn(_ sender: UIButton) {
        updateView(selected: sender.tag)
    }
    
    
    //구매 내역 VC
    private lazy var purchaseVC: PurchaseVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "PurchaseVC") as! PurchaseVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //판매 내역 VC
    private lazy var transactionListPage: SellVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "SellVC") as! SellVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //전시 내역 VC
    private lazy var exhibitListPage : AlarmExhibitVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "AlarmExhibitVC") as! AlarmExhibitVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}



extension MultiNotifyVC {
    @objc func backMyPage(){
        navigationController?.popViewController(animated: true)
    }

    
    private func add(asChildViewController viewController: UIViewController) {
        
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
           firstImg.isHidden = false
            secondImg.isHidden = true
            thirdImg.isHidden = true

            remove(asChildViewController: transactionListPage)
            remove(asChildViewController: exhibitListPage)
            add(asChildViewController: purchaseVC)
            buyListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            sellListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            
        } else if selected == 1{
            firstImg.isHidden = true
            secondImg.isHidden = false
            thirdImg.isHidden = true
            
            remove(asChildViewController: purchaseVC)
            remove(asChildViewController: exhibitListPage)
            add(asChildViewController: transactionListPage)
            sellListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            buyListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            
        } else {
            firstImg.isHidden = true
            secondImg.isHidden = true
            thirdImg.isHidden = false
           print("firts")
            remove(asChildViewController: purchaseVC)
           remove(asChildViewController: transactionListPage)
            add(asChildViewController: exhibitListPage)
            sellListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            buyListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            print("hello")
        }
    }
}

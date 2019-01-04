//
//  MultiNotifyVC.swift
//  Artoo
//
//  Created by 보윤 on 02/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class MultiNotifyVC: UIViewController {
    
    @IBOutlet weak var buyListBtn: UIButton!
    @IBOutlet weak var sellListBtn: UIButton!
    @IBOutlet weak var exhibitListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(selected: 0)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var containerView: UIView!
    
    
    @IBAction func ChangeTapBtn(_ sender: UIButton) {
    
        updateView(selected: sender.tag)
    }
    
    private lazy var buyListPage: SellListVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "allSellList") as! SellListVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var transactionListPage: sellTableVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "transactionList") as! sellTableVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var exhibitListPage: exhibitListVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "exhibitList") as! exhibitListVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}

extension MultiNotifyVC {
    
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
           
            remove(asChildViewController: transactionListPage)
            remove(asChildViewController: exhibitListPage)
            add(asChildViewController: buyListPage)
            buyListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            sellListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            
        } else if selected == 1{
           
            remove(asChildViewController: buyListPage)
            remove(asChildViewController: exhibitListPage)
            add(asChildViewController: transactionListPage)
            sellListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            buyListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            
        } else {
           print("firts")
            remove(asChildViewController: buyListPage)
           remove(asChildViewController: transactionListPage)
            add(asChildViewController: exhibitListPage)
            sellListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            buyListBtn.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
            exhibitListBtn.setTitleColor(UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1), for: .normal)
            print("hello")
        }
    }
}

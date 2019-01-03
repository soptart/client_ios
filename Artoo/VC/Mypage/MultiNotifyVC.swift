//
//  MultiNotifyVC.swift
//  Artoo
//
//  Created by 보윤 on 02/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class MultiNotifyVC: UIViewController {

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

}

extension MultiNotifyVC {
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        
        containerView.addSubview(viewController.view)
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private func updateView(selected: Int){
    if selected == 0{
        add(asChildViewController: buyListPage)
    }
    }
}

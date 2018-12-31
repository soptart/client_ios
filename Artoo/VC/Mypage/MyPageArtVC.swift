//
//  MyPageArtVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageArtVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(isData: 0)
        // Do any additional setup after loading the view.
    }
    
    private lazy var imagepageStore: MyPageImgStoreVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "imgStorePage") as! MyPageImgStoreVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var uploadPage: NoArtVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "no_art") as! NoArtVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()

}

extension MyPageArtVC{
    
    private func add(asChildViewController viewController: UIViewController){
        
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
    
    private func updateView(isData: Int){
        if isData == 1 {
        remove(asChildViewController: uploadPage)
            add(asChildViewController: imagepageStore)
        }else {
            remove(asChildViewController: imagepageStore)
            add(asChildViewController: uploadPage)
        }
    }
}

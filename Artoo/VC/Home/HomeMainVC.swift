//
//  HomeMainVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 22..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class HomeMainVC: UIViewController {

    @IBOutlet weak var todayBtn: UIButton!
    @IBOutlet weak var themeBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    
    
    @IBAction func changeView(_ sender: UIButton) {
        updateView(selected: sender.tag)
    }
    
    
   //투데이 화면 관리 컨트롤러
    private lazy var homeTodayVC: HomeTodayVC = {
        let storyboard = Storyboard.shared().homeStoryboard
        
        
        var viewController = storyboard.instantiateViewController(withIdentifier: HomeTodayVC.reuseIdentifier) as! HomeTodayVC

        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    
    //테마 화면 관리 컨트롤러
    private lazy var homeThemeVC: HomeThemeVC = {
        
        let storyboard = Storyboard.shared().homeStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: HomeThemeVC.reuseIdentifier) as! HomeThemeVC
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(selected: 0) //기본 뷰 투데이
    }
    
}


extension HomeMainVC {
        
        private func add(asChildViewController viewController: UIViewController) {
            
            addChild(viewController)
            containerView.addSubview(viewController.view)
            
            viewController.view.frame = containerView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            viewController.didMove(toParent: self)
        }
        
    
        private func remove(asChildViewController viewController: UIViewController) {
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
        
    
        private func updateView(selected : Int) {
            if selected == 0 {
                remove(asChildViewController: homeThemeVC)
                add(asChildViewController: homeTodayVC)
            } else {
                remove(asChildViewController: homeTodayVC)
                add(asChildViewController: homeThemeVC)
            }
        }
        
        
        
}



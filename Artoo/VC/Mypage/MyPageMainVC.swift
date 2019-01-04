//
//  MyPageMainVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageMainVC: UIViewController {

    @IBOutlet weak var MainIntroductionLabel: UILabel!
    @IBOutlet weak var EditTextView: UITextView!
    @IBOutlet weak var artBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EditTextView.isScrollEnabled = false
        updateView(selected: 0)
    }
    
    //알림 버튼 눌렀을 때
    @IBAction func notificationBtn(_ sender: Any) {
        
        guard let noticeVC = storyboard?.instantiateViewController(withIdentifier: "multinotify") as? MultiNotifyVC else { return }
        
        navigationController?.pushViewController(noticeVC, animated: true)
    }
    
    //설정 버튼 눌렀을 때
    
    @IBAction func settingBtn(_ sender: Any) {
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "settingMainPage") as? SettingMainVC else { return }
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    //버튼 눌렀을 때
    @IBAction func EditBtn(_ sender: Any) {
        EditTextView.isEditable = true
        MainIntroductionLabel.textColor = UIColor.lightGray
    }
    
    //저장 버튼 눌렀을 때
    @IBAction func SaveBtn(_ sender: Any) {
        EditTextView.isEditable = false
        MainIntroductionLabel.textColor = UIColor.darkGray
    }
    
    //버튼에 따라서 아래 뷰가 바뀌기.
    @IBAction func changeView(_ sender: UIButton) {
        updateView(selected: sender.tag)
    }
    
    //art_page리턴
    private lazy var artPage: MyPageArtVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "art_page") as! MyPageArtVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //store_page리턴
    private lazy var storePage: MyPageStoreVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "store_page") as! MyPageStoreVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    //buy_page리턴
    private lazy var buyPage: MyPageBuyVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "buy_page") as! MyPageBuyVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //review_page리턴
    private lazy var reviewPage: MyPageReviewVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "review_page") as! MyPageReviewVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}

extension MyPageMainVC {
    
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
    
    private func updateView(selected: Int){
        if selected == 0 {
            remove(asChildViewController: storePage)
            remove(asChildViewController: buyPage)
            remove(asChildViewController: reviewPage)
            add(asChildViewController: artPage)
        } else if selected == 1 {
            remove(asChildViewController: artPage)
            remove(asChildViewController: buyPage)
            remove(asChildViewController: reviewPage)
            add(asChildViewController: storePage)
        } else if selected == 2 {
            remove(asChildViewController: artPage)
            remove(asChildViewController: storePage)
            remove(asChildViewController: reviewPage)
            add(asChildViewController: buyPage)
        } else {
            remove(asChildViewController: artPage)
            remove(asChildViewController: storePage)
            remove(asChildViewController: buyPage)
            add(asChildViewController: reviewPage)
        }
    }
}

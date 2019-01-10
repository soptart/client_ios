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
    @IBOutlet weak var noticeView: UIView!
    
    var userInfo: String!
    var userMypageInfomation: MyArt?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EditTextView.isScrollEnabled = false
        updateView(selected: 0)
        noticeView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }
    
    //알림 버튼 눌렀을 때
    @IBAction func notificationBtn(_ sender: Any) {
        
        guard let noticeVC = storyboard?.instantiateViewController(withIdentifier: "multinotify") as? MultiNotifyVC else { return }
        
        navigationController?.pushViewController(noticeVC, animated: true)
    }
    
    // 확인 번튼 눌렀을 때 작품 업로드 창 넘어가기
    @IBAction func okBtn(_ sender: Any) {
        guard let uploadVC = storyboard?.instantiateViewController(withIdentifier: "uploadMain") as? UploadMainVC else { return }
        
        navigationController?.pushViewController(uploadVC, animated: true)
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
        if EditTextView!.text == "" {
            self.view.makeToast("회원정보를 입력하고 저장 버튼을 눌러주세요.")
        }
        let userIndex = UserDefaults.standard.integer(forKey: "userIndex")
        userInfo = self.EditTextView?.text!
       print(userIndex)
        print(userInfo)
        print("하하하")
        UserModifyService.shared.modifyUserInfo(user_idx: userIndex, u_description: self.userInfo!) {
            (data) in guard let status = data.status else { return }
            switch status {
            case 200: do{
                print("회원정보수정")
                if let mypageData = data.data{
                    self.userMypageInfomation = mypageData
                    print("\(mypageData)")
                }
                self.MainIntroductionLabel.isEnabled = true
                self.MainIntroductionLabel.textColor = UIColor(displayP3Red: 74, green: 74, blue: 74, alpha: 1)
            }
            case 404:
                print("유저 조회 실패")
                //유저 조회 실패
            case 401:
                print("hi3")
                //회원 인증 실패
            default:
                print("hi")
                
            }
            
        }
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
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentNoticeView), name: Notification.Name("presentNoticeView"), object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("presentNoticeView"), object: nil)
    }
    
    @objc func presentNoticeView() {
        noticeView.isHidden = false
    }
}

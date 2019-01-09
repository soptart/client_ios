//
//  SignVC.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SignVC: UIViewController {
    
    
    @IBOutlet weak var goSign2Btn: UIButton!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passLabel: UITextField!
    
    
    
    //회원가입 두번째 UI
    private lazy var signVC2 : SignVC2 = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: SignVC2.reuseIdentifier) as! SignVC2
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goSign2Btn.addTarget(self, action: #selector(goSign2), for: .touchUpInside)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

extension SignVC {
    
    //두번째 회원가입 창으로 넘어가는 함수
    @objc func goSign2(){
        
        if(nameLabel.text == "" || emailLabel.text == "" || passLabel.text == ""){
            // 하나라도 빈 값이 있을 시
            let alert = UIAlertController(title: "경고", message: "빈 칸을 채워주세요", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
        } else if (passLabel.text?.count)! < 8 {
            //비밀번호가 8자리 이상이 아닐 시
            let alert = UIAlertController(title: "경고", message: "비밀번호는 8자리 이상 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
        }else{
            //두 케이스에 모두 해당하지 않을 시 다음 컨트롤러로 값을 옮김
            signVC2.name = nameLabel.text!
            signVC2.email = emailLabel.text!
            signVC2.pass = passLabel.text!
            navigationController?.pushViewController(signVC2, animated: true)
    }
    
    }

}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

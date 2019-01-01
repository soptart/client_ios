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
    }
    
    
}

extension SignVC {
    
    //두번째 회원가입 창으로 넘어가는 함수
    @objc func goSign2(){
        
        //필수 항목 하나라도 빠져있을 시 경고창 -> 디자인과 상의해야함
        if(nameLabel.text == "" || emailLabel.text == "" || passLabel.text == ""){
            print("sign1 빈칸을 채워주세요")
        }else{
            signVC2.name = nameLabel.text!
            signVC2.email = emailLabel.text!
            signVC2.pass = passLabel.text!
            navigationController?.pushViewController(signVC2, animated: true)
        }
    }
}

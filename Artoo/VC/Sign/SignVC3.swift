//
//  SignVC3.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit
import Toast_Swift

class SignVC3: UIViewController {
    
    @IBOutlet weak var finishSignBtn: UIButton!
    
    //sign1에서 받는 정보
    var name:String!
    var email:String!
    var pass:String!
    
    //sign2에서 받는 정보
    var phone:String!
    var location:String!
    var school:String?     //선택 사항
    
    //sign 3에서 받는 정보
    var bank:String!
    var account:String!
    
    @IBOutlet weak var sign3BackBtn: UIButton!
    
    @IBOutlet weak var bankLabel: UITextField!
    @IBOutlet weak var accountLabel: UITextField!
    
    
    //로그인VC
    private lazy var loginVC : LoginVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: LoginVC.reuseIdentifier) as! LoginVC
        
        return viewController
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishSignBtn.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        sign3BackBtn.addTarget(self, action: #selector(popSign3), for: .touchUpInside)
    }
    
    
    
}

extension SignVC3 {
    @objc func backToLogin(){
        //만약 성공하면 로그인화면으로, 아니면 알림창
        
        if(bankLabel.text == "" || accountLabel.text == ""){
            print("sign3 빈칸을 채워주세요")
        }else{
            //회원가입 통신 후 이동
            bank = bankLabel.text
            account = accountLabel.text
            goSign()
        }
    }
    
    @objc func popSign3(){
        navigationController?.popViewController(animated: true)
    }
    
    func goSign(){
        SignService.shared.sign(email: email, password: pass, name: name, phone: phone, adress: location, bank: bank, account: account, school: school) {
            //escape 클로저로 받아온 status 정보로 분기
            (status) in let status = status
            
            print(status)
            
            switch status {
            case 201:
                self.navigationController?.pushViewController(self.loginVC, animated: true)
            case 400:
                self.view.makeToast("이미 존재하는 이메일입니다")
            case 401...601:
                self.view.makeToast("네트워크 연결이 원활하지 않습니다.")
            default:
                print("hi")
            }
            
        }
    }
    
    
}



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
    var school:String!
    
    //sign 3에서 받는 정보
    var bank:String!
    var account:String!
    
    @IBOutlet weak var sign3BackBtn: UIButton!
    
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var accountLabel: UITextField!
    
    
    //뱅크 VC
    private lazy var bankVC : BankVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: BankVC.reuseIdentifier) as! BankVC
        
        return viewController
    }()

    
    
    //로그인VC
    private lazy var loginVC : LoginVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: LoginVC.reuseIdentifier) as! LoginVC
        
        return viewController
    }()
    
    
    //은행 선택하기 버튼 눌렀을 시
    @IBAction func bankSelectBtn(_ sender: Any) {
        bankVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(bankVC, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishSignBtn.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        sign3BackBtn.addTarget(self, action: #selector(popSign3), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

extension SignVC3 {
    @objc func backToLogin(){
        
        //만약 성공하면 로그인화면으로, 아니면 알림창
        
        if(bankLabel.text == "" || accountLabel.text == ""){
            //빈 값 처리
            let alert = UIAlertController(title: "경고", message: "빈 칸을 채워주세요", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
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
        SignService.shared.sign(email: email, password: pass, name: name, phone: phone, bank: bank, account: account, school: school) {
            (status) in let status = status
            
            print(status)
            
            switch status {
            case 201:
                //회원가입 완료
                let alert = UIAlertController(title: "회원가입성공", message: "로그인 창으로 이동합니다", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion:{ self.navigationController?.pushViewController(self.loginVC, animated: true)
                })
            case 400:
                //이메일 중복
                let alert = UIAlertController(title: "경고", message: "이미 존재하는 이메일입니다", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion:nil)
            case 401...601:
                let alert = UIAlertController(title: "경고", message: "네트워크 연결을 확인해주세요", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion:nil)            default:
                    print("hi")
            }
            
        }
    }
    
    
}



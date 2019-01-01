//
//  SignVC2.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SignVC2: UIViewController {
    
    //    u_email    String    not null
    //    u_pw    String    not null
    //    u_name    String    not null
    //    u_phone    String    not null
    //    u_address    String    주소
    //    u_bank    String    은행 //not_null
    //    u_account    String    계좌 //not_null
    //    u_school    String    학교
    //    u_dept    String    학과
    
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var schoolLabel: UITextField!
    
    @IBOutlet weak var goSign3Btn: UIButton!
    
    var name:String!
    var email:String!
    var pass:String!
    
    
    private lazy var signVC3 : SignVC3 = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: SignVC3.reuseIdentifier) as! SignVC3
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goSign3Btn.addTarget(self, action: #selector(goSign3), for: .touchUpInside)
        
    }
    
    
}

extension SignVC2 {
    @objc func goSign3(){
        
        if(phoneLabel.text == "" || locationLabel.text == ""){
            print("sign2 빈칸을 채워주세요")
            //학교는 빈칸이어도 됨
        }else{
            signVC3.name = name
            signVC3.email = email
            signVC3.pass = pass
            
            
            signVC3.phone = locationLabel.text!
            signVC3.location = locationLabel.text!
            if let schoolText = schoolLabel.text {
                signVC3.school = schoolText
            }
            navigationController?.pushViewController(signVC3, animated: true)
        }
        
    }
}

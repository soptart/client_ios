//
//  SignVC2.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SignVC2: UIViewController {
    
    
    
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var schoolLabel: UITextField!
    
    @IBOutlet weak var goSign3Btn: UIButton!
    @IBOutlet weak var sign2BackBtn: UIButton!
    
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
        sign2BackBtn.addTarget(self, action: #selector(popSign2), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
}

extension SignVC2 {
    @objc func goSign3(){
        
        if(phoneLabel.text == ""||schoolLabel.text == ""){
            let alert = UIAlertController(title: "경고", message: "빈 칸을 채워주세요", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
        }else{
            signVC3.name = name
            signVC3.email = email
            signVC3.pass = pass
            
            
            signVC3.phone = phoneLabel.text!
            
            signVC3.school = schoolLabel.text!
            navigationController?.pushViewController(signVC3, animated: true)
        }
        
    }
    
    @objc func popSign2(){
        navigationController?.popViewController(animated: true)
    }
}

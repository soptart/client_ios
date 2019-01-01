//
//  SignVC3.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SignVC3: UIViewController {
   
    @IBOutlet weak var finishSignBtn: UIButton!
    //로그인VC
    private lazy var loginVC : LoginVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: LoginVC.reuseIdentifier) as! LoginVC
        
        return viewController
    }()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishSignBtn.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        
    }
    
    
    
}

extension SignVC3 {
    @objc func backToLogin(){
       //만약 성공하면 로그인화면으로, 아니면 알림창
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


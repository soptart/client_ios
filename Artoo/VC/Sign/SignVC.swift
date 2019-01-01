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
    @objc func goSign2(){
        navigationController?.pushViewController(signVC2, animated: true)
    }
}

//
//  LoginVC.swift
//  Artoo
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.addTarget(self, action: #selector(goTab), for: .touchUpInside)
    }
    
}
extension LoginVC {
    
    @objc func goTab(){
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "tab")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
}


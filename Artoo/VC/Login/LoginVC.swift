//
//  LoginVC.swift
//  Artoo
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!

    @IBOutlet weak var joinBtn: UIButton!
    
    //회원가입 처음 UI
    private lazy var signVC : SignVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: SignVC.reuseIdentifier) as! SignVC
        
        return viewController
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.addTarget(self, action: #selector(goTab), for: .touchUpInside)
        joinBtn.addTarget(self, action: #selector(goSign), for: .touchUpInside)
    }
    
}
extension LoginVC {
    
    @objc func goTab(){
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "tab")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @objc func goSign(){
       print("HI")
        navigationController?.pushViewController(signVC, animated: true)
    }
}


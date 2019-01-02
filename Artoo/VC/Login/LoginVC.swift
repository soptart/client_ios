//
//  LoginVC.swift
//  Artoo
//  로그인 VC

import UIKit

class LoginVC: UIViewController {
    
    //로그인 함수 호출할 버튼
    @IBOutlet weak var loginBtn: UIButton!
    
    //회원가입으로 이동할 버튼
    @IBOutlet weak var joinBtn: UIButton!
    
    //이메일 & 패스워드 텍스트필드
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    //회원가입 처음 UI
    private lazy var signVC : SignVC = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: SignVC.reuseIdentifier) as! SignVC
        
        return viewController
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        joinBtn.addTarget(self, action: #selector(goSign), for: .touchUpInside)
    }
    
}
extension LoginVC {
    
    @objc func login(){
        let email = emailTextField.text
        let pass = passTextField.text
        
        if( email == "" || pass == ""){
            self.view.makeToast("빈 칸을 입력해주세요")
        }else{
            LoginService.shared.login(email: email!, password: pass!){
                (response) in guard let status = response.status else{ return }
                print(status)
                switch status {
                case 200:
                    self.view.makeToast("로그인 되었습니다")
                    guard let token = response.data?.token else { return }
                    //어디서든 쓸 수 있도록 UserDefault에 token을 저장함
                    UserDefaults.standard.set(token, forKey: "token")
                    self.goTab()
                case 400:
                    self.view.makeToast("로그인에 실패했습니다")
                case 401...500:
                    self.view.makeToast("네트워크 통신이 원활하지 않습니다")
                default:
                    print("hi")
                }
                
            }
            
        }
        
    }
    
    
    
    
    
    //회원가입 창으로 이동하는 함수
    @objc func goSign(){
        navigationController?.pushViewController(signVC, animated: true)
    }
    
    //탭으로 이동하는 함수 (로그인 성공시에만)
    func goTab(){
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "tab")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
}


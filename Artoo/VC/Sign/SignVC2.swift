//
//  SignVC2.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class SignVC2: UIViewController {
    
    @IBOutlet weak var goSign3Btn: UIButton!
    
    
    private lazy var signVC3 : SignVC3 = {
        let storyboard = Storyboard.shared().mainStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: SignVC3.reuseIdentifier) as! SignVC3
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    goSign3Btn.addTarget(self, action: #selector(goSign3), for: .touchUpInside)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignVC2 {
    @objc func goSign3(){
        navigationController?.pushViewController(signVC3, animated: true)
    }
}

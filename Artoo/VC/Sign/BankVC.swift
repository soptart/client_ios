//
//  BankVC.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 9..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class BankVC: UIViewController {
    
    var selectedBankText:String?
    
    var closureAfterUpdateUI:(() -> String)?
    
    
    //은행 골랐을 때
    @IBAction func selectBank(_ sender: UIButton) {
        let bankText = sender.currentTitle!
        selectedBankText = bankText
        
        dismiss(animated: true)
        
    }
    
    @IBAction func selectClose(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

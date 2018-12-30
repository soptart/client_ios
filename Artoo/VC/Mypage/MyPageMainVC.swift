//
//  MyPageMainVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class MyPageMainVC: UIViewController {

    @IBOutlet weak var MainIntroductionLabel: UILabel!
    @IBOutlet weak var EditTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EditTextView.isScrollEnabled = false
    }
    
    
    //버튼 눌렀을 때
    @IBAction func EditBtn(_ sender: Any) {
        EditTextView.isEditable = true
        MainIntroductionLabel.textColor = UIColor.lightGray
    }
    
    //저장 버튼 눌렀을 때
    @IBAction func SaveBtn(_ sender: Any) {
        EditTextView.isEditable = false
        MainIntroductionLabel.textColor = UIColor.darkGray
    }
    
    
    @IBAction func changeView(_ sender: UIButton) {
        
    }
    
}


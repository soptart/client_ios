//
//  tagUploadVC.swift
//  Artoo
//
//  Created by 보윤 on 02/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class tagUploadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //완료버튼 누르면 정보 서버에 보내기.
    @IBAction func finishBtn(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}

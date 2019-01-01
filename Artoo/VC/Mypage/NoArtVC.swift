//
//  NoArtVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class NoArtVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func uploadBtn(_ sender: Any) {
    
      //  let image = UIImage(named: "ggobuk")
        let alert = UIAlertController(title: "업로드 알림", message: "hello", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
   // action.setValue(image?.withRenderingMode(.alwaysOriginal), forKey: "image")
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
   
    
}

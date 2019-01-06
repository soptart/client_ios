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
        /*
        performSegue(withIdentifier: "notify", sender: self)
        */
        NotificationCenter.default.post(name: Notification.Name("presentNoticeView"), object: nil)
    }
    
   
    
}

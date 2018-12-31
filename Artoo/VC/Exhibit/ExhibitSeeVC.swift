//
//  ExhibitSeeVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 28..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitSeeVC: UIViewController {

    @IBOutlet weak var escapeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        escapeBtn.addTarget(self, action: #selector(escape), for: .touchUpInside)
    } 

}

extension ExhibitSeeVC {
   @objc func escape(){
    navigationController?.popViewController(animated: true)
    }
}

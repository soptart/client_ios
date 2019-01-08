//
//  ApplySuccessVC.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 8..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class ApplySuccessVC: UIViewController {

    //익숙함이 새로웠던 전 - 일상편
    @IBOutlet weak var displayTitleName: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var workNameLabel: UILabel!
   
    var displayText:String = ""
    var authorText:String = ""
    var workText:String = ""
    
    @IBAction func dismissDialog(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayTitleName.text = displayText
        authorLabel.text = authorText
        workNameLabel.text = workText
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

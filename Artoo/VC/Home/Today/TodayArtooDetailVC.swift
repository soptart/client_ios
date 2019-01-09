//
//  TodayArtooDetailVC.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 9..
//  Copyright © 2019년 홍정민. All rights reserved.
//

import UIKit

class TodayArtooDetailVC: UIViewController {
    var img:String?
    
    @IBAction func dismissDetail(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var contentHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        if(img == "homeContents2Content"){
            contentHeightConst.constant = 4000
        }else{
            contentHeightConst.constant = 2853
        }

     
            detailImageView.image = UIImage(named: img!)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

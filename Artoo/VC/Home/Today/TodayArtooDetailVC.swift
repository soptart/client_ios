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
    
    @IBOutlet weak var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = UIImage(named: img!)
      
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

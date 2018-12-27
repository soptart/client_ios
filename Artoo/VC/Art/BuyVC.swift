//
//  BuyVC.swift
//  Artoo
//
//  Created by 보윤 on 28/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class BuyVC: UIViewController {

    @IBOutlet weak var moreImg: UIImageView!
    
    @IBOutlet weak var pageCtr: UIPageControl!
    
    var images = ["exhibit","ggobuk","sopt_DoIT"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageCtr.numberOfPages = images.count
        pageCtr.currentPage = 0
        moreImg.image = UIImage(named: images[0])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        moreImg.image = UIImage(named: images[pageCtr.currentPage])
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

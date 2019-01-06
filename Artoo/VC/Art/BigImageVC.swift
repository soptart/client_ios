//
//  BigImageVC.swift
//  Artoo
//
//  Created by 보윤 on 29/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class BigImageVC: UIViewController {

    @IBOutlet weak var ImageNameLabel: UILabel!
    @IBOutlet weak var BigImageView: UIImageView!
    
    var imageName: String!
    var imageUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ImageNameLabel.text = imageName!
        BigImageView.imageFromUrl(gsno(imageUrl!), defaultImgPath: "ggobuk")
    
    }

}

//
//  All_ArtViewController.swift
//  Artoo
//
//  Created by 보윤 on 26/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class All_ArtViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var figureLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var sData: String?
    var fData: String?
    var cData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
        if let sTransData = sData {
            sizeLabel.text = sTransData
        }
        
        if let fTransData = fData{
            figureLabel.text = fTransData
        }

        if let cTransData = cData{
            categoryLabel.text = cTransData
        }
    }

    //필터 버튼 눌렀을 때 필터 화면으로 넘어가기.
    @IBAction func filterBtn(_ sender: Any) {
        
       guard let fVC =
        storyboard?.instantiateViewController(withIdentifier: "filter") as? FilterViewController else{ return }
        
        navigationController?.pushViewController(fVC, animated: true)
        
        
    }
    
    
}

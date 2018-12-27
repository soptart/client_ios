//
//  FilterViewController.swift
//  Artoo
//
//  Created by 보윤 on 26/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    var size: String?
    var figure: String?
    var category: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //찾기 버튼 누르면 버튼에 해당하는 글자를 변수에 저장한 후 초기화면 라벨에 연결해주기.
    
    @IBAction func findBtn(_ sender: UIButton) {
        
        if sender.tag == 1 {
            size = "S"
        }else if sender.tag == 2{
            size = "M"
        }else if sender.tag == 3{
            size = "L"
        }else if sender.tag == 4{
            size = "XL"
        }else if sender.tag == 5{
            figure = "동양화"
        }else if sender.tag == 11{
            category = "인물"
        }
        
        guard let aVC = storyboard?.instantiateViewController(withIdentifier: "all") as? All_ArtViewController else { return }
        
        size = "s"
        figure = "동양화"
        category = "인물"
        
        //print(size)
        
         aVC.sData = size
        aVC.fData = figure
        aVC.cData = category
        
        
       // aVC.figureLabel.text = figure
       // aVC.categoryLabel.text = category
        
        navigationController?.pushViewController(aVC, animated: true)
    }
    

}

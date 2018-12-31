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

    //필터 값 저장하는 구조체 filter
    var filterData:Filter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //찾기 버튼 누르면 버튼에 해당하는 글자를 변수에 저장한 후 초기화면 라벨에 연결해주기.
    
    
    @IBAction func sizeBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            size = "S"
        }else if sender.tag == 2{
            size = "M"
        }else if sender.tag == 3{
            size = "L"
        }else if sender.tag == 4{
            size = "XL"
        }
    }
    
    @IBAction func figureBtn(_ sender: UIButton) {
        if sender.tag == 5{
            figure = "동양화"
        }else if sender.tag == 6{
            figure = "드로잉"
        }else if sender.tag == 7{
            figure = "공예"
        }else if sender.tag == 8{
            figure = "설치/조형"
        }else if sender.tag == 9{
            figure = "혼합매체"
        }else if sender.tag == 10{
            figure = "페인팅"
        }
    }
    
    @IBAction func categoryBtn(_ sender: UIButton) {
        if sender.tag == 11{
            category = "인물"
        }else if sender.tag == 12{
            category = "동식물"
        }else if sender.tag == 13{
            category = "사물"
        }else if sender.tag == 14{
            category = "추상"
        }else if sender.tag == 15{
            category = "풍경"
        }
    }
    
    @IBAction func findBtn(_ sender: UIButton) {
        
        //버튼 누르면 구조체 전달
        
        filterData = Filter(size:size, figure: figure, category:category)
        
        guard let aVC = storyboard?.instantiateViewController(withIdentifier: "all") as? All_ArtVC else { return }
        
        
        aVC.sData = filterData?.size
        aVC.fData = filterData?.figure
        aVC.cData = filterData?.category
        
        
       // aVC.figureLabel.text = figure
       // aVC.categoryLabel.text = category
        
        navigationController?.pushViewController(aVC, animated: true)
    }
    

}

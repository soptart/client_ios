//
//  ExhibitApplyVC.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 28..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class ExhibitApplyVC: UIViewController {

    //전시 테이블뷰
    @IBOutlet weak var exhibitTV: UITableView!
    
    //내 작품 컬렉션뷰
    @IBOutlet weak var myWorkCV: UICollectionView!
    
    
    //닫기 버튼
    @IBOutlet weak var closeBtn: UIButton!
    
    //전시기간 라벨
    @IBOutlet weak var dateLabel: UILabel!
    
    //신청기간 라벨
    @IBOutlet weak var deadLineLabel: UILabel!
    
    //작품 수 라벨
    @IBOutlet weak var numberLabel: UILabel!
    
    //신청인원 라벨
    @IBOutlet weak var personLabel: UILabel!
    
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

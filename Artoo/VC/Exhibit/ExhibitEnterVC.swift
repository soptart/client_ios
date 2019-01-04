//
//  ExhibitEnterVC.swift
//  Artoo
//
//// 전시입장하기 VC

import UIKit

class ExhibitEnterVC: UIViewController {
    
    //전시 입장 창에서 써야 할 데이터
    var exhibitEnterData:Exhibit?
    
    
    //전시 기간 라벨
    @IBOutlet weak var exhibitDateLabel: UILabel!
    
    //메인 텍스트
    @IBOutlet weak var mainLabel: UILabel!
    
    //서브 텍스트
    @IBOutlet weak var subLabel: UILabel!
    
    //입장하기 버튼
    @IBOutlet weak var enterBtn: UIButton!
    
    //닫기 버튼
    @IBOutlet weak var closeBtn: UIButton!
    
    
    //참여 작가를 나타낼 라벨
    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    //전시 관람VC
    private lazy var exhibitSeeVC : ExhibitSeeVC = {
        let storyboard = Storyboard.shared().exhibitStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ExhibitSeeVC.reuseIdentifier) as! ExhibitSeeVC
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI에 받아온 데이터 반영
        setUI()
        
        enterBtn.addTarget(self, action: #selector(enterExhibit), for: .touchUpInside)
        closeBtn.addTarget(self, action: #selector(closeExhibit), for: .touchUpInside)
    }
    
    
}

extension ExhibitEnterVC {
    func setUI(){
        var exhibitDate:String = ""
        
        guard let data = exhibitEnterData else { return }
        
            exhibitDate += gsno(data.startDate)
        
            exhibitDate += ("~" + gsno(data.endDate))
        
        exhibitDateLabel.text = exhibitDate
        
        mainLabel.text = gsno(data.exhibitTitle)
        subLabel.text = gsno(data.exhibitSubTitle)
        authorLabel.text = "윤여정 홍정민 등등등"

    }
    
    
    @objc func enterExhibit(){
        navigationController?.pushViewController(exhibitSeeVC, animated: true)
    }
    @objc func closeExhibit(){
        navigationController?.popViewController(animated: true)    }
    
}

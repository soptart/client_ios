//
//  ExhibitEnterVC.swift
//  Artoo
//
//// 전시입장하기 VC

import UIKit

class ExhibitEnterVC: UIViewController {
    
    //메인 텍스트
    @IBOutlet weak var mainLabel: UILabel!
    
    //서브 텍스트
    @IBOutlet weak var subLabel: UILabel!
    
    //입장하기 버튼
    @IBOutlet weak var enterBtn: UIButton!
    
    //닫기 버튼
    @IBOutlet weak var closeBtn: UIButton!
    
    //전시 관람VC
    private lazy var exhibitSeeVC : ExhibitSeeVC = {
        let storyboard = Storyboard.shared().exhibitStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: ExhibitSeeVC.reuseIdentifier) as! ExhibitSeeVC
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterBtn.addTarget(self, action: #selector(enterExhibit), for: .touchUpInside)
        
        closeBtn.addTarget(self, action: #selector(closeExhibit), for: .touchUpInside)
    }
    
    
}

extension ExhibitEnterVC {
    @objc func enterExhibit(){
        print("hi")
        navigationController?.pushViewController(exhibitSeeVC, animated: true)
    }
    @objc func closeExhibit(){
        navigationController?.popViewController(animated: true)    }
    
}

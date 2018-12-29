//
//  DealVC.swift
//  Artoo
//
//  Created by 보윤 on 29/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class DealVC: UIViewController {

    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var meetBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    //버튼 눌렀을 때 어떠한 일이 발생될까?
    @IBAction func changeView(_ sender: UIButton) {
        updateView(selected: sender.tag)
    }
    
    private lazy var deliveryServiceVC: deliveryVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        //viewController는 한 마디로 deliveryVC이다.
        var viewController = storyboard.instantiateViewController(withIdentifier: "delivery") as! deliveryVC
        
        self.add(asChildViewController: viewController)
        
        //deliveryVC반환해준다고 생각해보자
        return viewController
    }()
    
    private lazy var MeetServiceVC: MeetVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "meet") as! MeetVC
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(selected: 0)
        // Do any additional setup after loading the view.
    }

}

extension DealVC{
    
    private func add(asChildViewController viewController: UIViewController){
        
        addChild(viewController)
   /*containerView에 delivery객체의 뷰를 붙여준다고 생각하기*/ containerView.addSubview(viewController.view)
        
      viewController.view.frame = containerView.bounds
      viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //deliveryVC는 DealVC로 움직여와라
        viewController.didMove(toParent: self)
        
    }
    
    //화면에서 제거하는 함수
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func updateView(selected: Int){
        if selected == 0 {
    remove(asChildViewController: MeetServiceVC)
        add(asChildViewController: deliveryServiceVC)
        }else {
            remove(asChildViewController: deliveryServiceVC)
            add(asChildViewController: MeetServiceVC)
        }
    }
}

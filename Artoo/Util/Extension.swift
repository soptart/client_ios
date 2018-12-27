//
//  Extension.swift
//  Artoo

import UIKit
import Photos

extension NSObject {
    static var reuseIdentifier:String {
        return String(describing:self)
    }
}


extension UIViewController {
    
  
    func addChildView(containerView : UIView, asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        containerView.addSubview(viewController.view)
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    func removeChildView(containerView : UIView, asChildViewController viewController: UIViewController) {
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
}




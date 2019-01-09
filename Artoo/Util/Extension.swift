//
//  Extension.swift
//  Artoo

import UIKit
import Photos
import Kingfisher

extension NSObject {
    static var reuseIdentifier:String {
        return String(describing:self)
    }
}

extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
    
    //이미지 둥글게 만드는 코드
    public func roundImage(num: Float){
        self.layer.cornerRadius =  self.bounds.width * CGFloat(num)
        self.clipsToBounds = true
    }
    
    
}


extension Date {
    public func datecontrol(_ value: Date?) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd, hh:mm:ss.SSSZ"
        
        let writeDate = dateFormatter.string(from: value ?? Date())
        return writeDate
    }
}


extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: controlState)
    }
}

extension UITableViewCell {
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
}

extension UICollectionViewCell {
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
}

extension String {
    // \\n -> \n으로 바꾸어 주는 함수
    func removeNewLine(str: String) -> String {
        if(str.contains("\\n")){
            let newText = str.replacingOccurrences(of: "\\n", with: "\n")
            return newText
        }
        return str
    }
    
    func newLineToBlank(str: String) -> String {
        if(str.contains("\\n")){
            let newText = str.replacingOccurrences(of: "\\n", with: " ")
            return newText
        }
        return str
    }

}

extension UIViewController {
    
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
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

extension UIImage {
    var cropRatio: CGFloat {
        return self.size.width / self.size.height
    }
}

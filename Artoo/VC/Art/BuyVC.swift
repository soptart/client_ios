//
//  BuyVC.swift
//  Artoo
//
//  Created by 보윤 on 28/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class BuyVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var moreImg: UIImageView!
    @IBOutlet weak var desc: UITextView?
    @IBOutlet weak var slideButton: UIButton?
    @IBOutlet weak var figureLabel: UILabel?
    @IBOutlet weak var procedureLabel: UILabel?
    @IBOutlet weak var feedBackLabel: UILabel?
    @IBOutlet weak var feedContentLabel: UILabel?
    @IBOutlet weak var feedContentTV: UITextView?
    @IBOutlet weak var artNameLabel: UILabel!
    @IBOutlet weak var artLikeCountLabel: UILabel!
    @IBOutlet weak var authorSchoolLabel: UILabel!
    @IBOutlet weak var authorNameabel: UILabel!
    @IBOutlet weak var artYearLabel: UILabel!
   
    
    
    
    var images = ""
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var artDetailInfo: ArtWork?
    var textHolder = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hihihhi")
        print("\(artDetailInfo!)")
//        moreImg.imageFromUrl(gsno(artDetailInfo?.artImg), defaultImgPath: "ggobuk")
        
        setDetail()

        desc?.delegate = self
        
        //이미지 선택 시
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(BuyVC.bigImage))
        moreImg.addGestureRecognizer(pictureTap)
        moreImg.isUserInteractionEnabled = true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //댓글 저장하기 버튼 누르면
    @IBAction func commentBtn(_ sender: Any) {
        
        
    }
    //아래 버튼 누르면
    @IBAction func slideBtn(_ sender: Any) {
        
        desc?.delegate = self
        
        let fixedHeight = desc?.frame.size.width
        
        //새로운 사이즈 저장해주기.
        let newSize: CGSize = desc!.sizeThatFits(CGSize(width: fixedHeight!, height: CGFloat(MAXFLOAT)))
        
        var newFrame = desc!.frame
        
        newFrame.size = CGSize(width: CGFloat(fmaxf(Float(newSize.width), Float(fixedHeight!))), height: newSize.height)
        
        // 아래로 이동시킬 높이
        var height = newFrame.size.height - 76
        
        desc!.frame = newFrame

        //버튼, 라벨 아래로 내리기
        slideButton!.frame.origin = CGPoint(x: 0, y: 500 + height)
        
        figureLabel!.frame.origin = CGPoint(x: 113, y:541 + height)
        procedureLabel!.frame.origin = CGPoint(x:138, y: 563 + height)
        feedBackLabel!.frame.origin = CGPoint(x:20, y:608 + height)
        feedContentLabel!.frame.origin = CGPoint(x:20, y:632 + height)
        feedContentTV!.frame.origin = CGPoint(x:20, y:662 + height)
        }
    
    //구매하기 버튼 누른다면 거래 창으로 이동
    @IBAction func buyBtn(_ sender: Any) {
        
        guard let dVC = storyboard?.instantiateViewController(withIdentifier: "deal") as? DealVC else { return }
        
        navigationController?.pushViewController(dVC, animated: true)
        
        dVC.buyItemName = artNameLabel.text!
        dVC.buyImageUrl = artDetailInfo?.artImg!
       dVC.buyPrice = artDetailInfo?.price!
        print(dVC.buyPrice)
        
        dVC.sendUserIndex = UserDefaults.standard.integer(forKey: "userIndex")
        dVC.sendArtIndex = artDetailInfo?.artIndex!
        
    }
    
    //이미지 버튼 누른다면
    @objc func bigImage(){
        guard let BigVC = storyboard?.instantiateViewController(withIdentifier: "BigImg") as? BigImageVC else{ return }
        
        navigationController?.pushViewController(BigVC, animated: true)
        
        BigVC.imageName = artDetailInfo?.artName!
        BigVC.imageUrl = artDetailInfo?.artImg!
        
    }
}

extension BuyVC {
    
    func setDetail(){
        moreImg.imageFromUrl(gsno(artDetailInfo?.artImg), defaultImgPath: "ggobuk")
        
        artNameLabel.text = artDetailInfo?.artName!
        authorSchoolLabel.text = artDetailInfo?.userSchool!
        authorNameabel.text = artDetailInfo?.userName!
        artLikeCountLabel.text = String(describing: gino(artDetailInfo?.likeCount!))
        desc?.text = artDetailInfo?.workDetail!
        artYearLabel.text = artDetailInfo?.artYear!

    }
}


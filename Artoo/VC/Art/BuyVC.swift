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
    @IBOutlet weak var artPriceLabel: UILabel!
    
    
    
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
        /*
        desc?.text = "욕망과 억압에 대해 이야기한다. 들판이라는 고상한 공간에 이 주제를 배치시키고, 고도의 훈련된 정신과 이성이 필요한 들판을 도구로이끌어 가는데, 집이라는 공간과 들판에서 오랜 시간동안 지독한 훈련과 과잉 예속 속에서 점점 더 자기 자신에게 빛이 되어가"
        */
        desc?.delegate = self
        
        //이미지 선택 시
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(BuyVC.bigImage))
        moreImg.addGestureRecognizer(pictureTap)
        moreImg.isUserInteractionEnabled = true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //아래 버튼 누르면
    @IBAction func slideBtn(_ sender: Any) {
        
        /*
        desc?.text = "욕망과 억압에 대해 이야기한다. 들판이라는 고상한 공간에 이 주제를 배치시키고, 고도의 훈련된 정신과 이성이 필요한 들판을 도구로이끌어 가는데, 집이라는 공간과 들판에서 오랜 시간동안 지독한 훈련과 과잉 예속 속에서 점점 더 자기 자신에게 빛이 되어가.   에 더해서 말이죠 더 추가할건데,,,어땟을까요? 한번 늘어나나 보죠, 아요파팅입니다만,,,,ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ네네네. 어어어어어어어어어어어러재ㅓㄹ젇럊러쟈ㅓㄹ재ㅓ랻러ㅑㄷㅈ러ㅑㄷ저랴ㅐㄷ저래ㅑㅈ더랴저래ㅑㄷ저래ㅑㅈ덜ㅈ덜저래ㅑㄷ럊더래ㅑㅓㄹ절덜절댜ㅓㅑ저래ㅑㅈ더래저랴ㅐㅈ더래ㅑ저래ㅑ더랴ㅐ젇래ㅑㅓㄷㅈ래ㅑㅓㅈㄷjdfjsdoifjdsfjdsfjdoisjfidsfjisdjfidsojfoidsjfoisdjfiosdjfoisdfjoiwfjwiofjwiofjwiofjwoifjewiofjweoifjweoifjwoifjwoifjweoif"
        */
        //텍스트 뷰의 높이를 얻어옴
        
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
        print(String(describing: gino(artDetailInfo?.likeCount)))
        
        artPriceLabel.text = String(describing: gino(artDetailInfo?.price))
        desc?.text = artDetailInfo?.workDetail!
        artYearLabel.text = artDetailInfo?.artYear!
        
        
        
    }
}

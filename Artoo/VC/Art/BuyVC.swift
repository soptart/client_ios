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
    @IBOutlet weak var figureLabel: UILabel?
    @IBOutlet weak var feedBackLabel: UILabel?
    @IBOutlet weak var feedContentLabel: UILabel?
    @IBOutlet weak var feedContentTV: UITextView?
    @IBOutlet weak var artNameLabel: UILabel!
    @IBOutlet weak var artLikeCountLabel: UILabel!
    @IBOutlet weak var authorSchoolLabel: UILabel!
    @IBOutlet weak var authorNameabel: UILabel!
    @IBOutlet weak var artYearLabel: UILabel!
    @IBOutlet weak var artFigureLabel: UILabel!
    @IBOutlet weak var artFigureLabelText: UILabel!
    @IBOutlet weak var artArticleLabel: UILabel!
    @IBOutlet weak var artArticleLabelText: UILabel!
    @IBOutlet weak var artPriceLabel: UILabel!
    @IBOutlet weak var licenseImage: UIImageView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var priceImage: UIImageView!
    @IBOutlet weak var heartImg: UIButton!
    @IBOutlet weak var sizeLabelText: UILabel!
    
    @IBOutlet weak var sizeImg: UIImageView!
    
    
    
    //작품 표현기법, 재료 등이 표시되어야 함 -> 서버에서 정보를 불러올 것.
    var images = ""
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var artDetailInfo: ArtWork?
    var textHolder = ""
    var comments: String?
    var sendArtIndex: Int?
    var userIndex: Int?
    var commentsList : [Comments] = [] //코멘트 테이블 뷰를 위한 댓글 리스트
    var lilcense: String?
    var likeDetailInfo: ArtWorkLike?
    var width: Int?
    var height: Int?
    var depth: Int?
    
    @IBOutlet weak var commentsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedContentTV?.delegate = self
        
        moveBuyVC(completion: setDetail) //작품 상세 조회
       // setUpData(completion: setUI) //댓글 조회
        commentsTable.delegate = self
        commentsTable.dataSource = self
        
        //처음에는 안 보이게 한다
        desc?.delegate = self
        artFigureLabel.isHidden = true
        artFigureLabelText.isHidden = true
        artArticleLabel.isHidden = true
        artArticleLabelText.isHidden = true
        figureLabel?.isHidden = false
        //이미지 선택 시
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(BuyVC.bigImage))
        moreImg.addGestureRecognizer(pictureTap)
        moreImg.isUserInteractionEnabled = true
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        //댓글 창을 처음 딱 닿으면 기존 값 없애기
        if feedContentTV?.isFirstResponder == true {
            feedContentTV?.text = ""
        }
        
        if feedContentTV?.isEditable == true{
            feedContentTV?.textColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }

    //댓글 저장하기 버튼 누르면
    @IBAction func commentBtn(_ sender: Any) {
        
        comments = feedContentTV!.text!
        feedContentTV?.text! = comments!
        sendArtIndex = artDetailInfo?.artIndex!
        userIndex = UserDefaults.standard.integer(forKey: "userIndex")
        
        uploadCommentService.shared.comment(comment: self.comments!, comment_Index: userIndex!, art_Index: self.sendArtIndex!){
            (status) in let status = status

            print(status)
            
            switch status {
            case 201: do {
                //작품 표현 기법, 재료가 보인다.
                self.artFigureLabel.isHidden = false
                self.artFigureLabelText.isHidden = false
                self.artArticleLabel.isHidden = false
            self.artArticleLabelText.isHidden = false
                self.figureLabel?.isHidden = true
                self.feedContentTV?.text = ""
                self.setUpData(completion: self.setUI)
                self.buyBtn.setImage(UIImage(named:"artworkBuyColor"), for: .normal)
                self.priceImage.image = UIImage(named:"artworkPriceColor")
            }
            self.view.makeToast("댓글 작성 성공")
            case 400:
            self.view.makeToast("댓글을 작성하고 저장버튼을 눌러주세요")
            default: print("댓글 설정 부분")
                
            }
        }
        
    }
    
    //뒤로 버튼 누르면
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    //구매하기 버튼 누른다면 거래 창으로 이동
    @IBAction func buyBtn(_ sender: Any) {
        
        guard let dVC = storyboard?.instantiateViewController(withIdentifier: "deal") as? DealVC else { return }
        
        navigationController?.pushViewController(dVC, animated: true)
        
        dVC.buyItemName = artNameLabel?.text!
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
    
    //좋아요 버튼 누르면
    @IBAction func heartBtn(_ sender: Any) {
        print("좋아요 누르면)")
        setHeart(completion: heartDetail)
    }
    
    //사이드 버튼 누른다면
    @IBAction func artDeleteBtn(_ sender: Any) {
        alert()
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
        artPriceLabel.text = String(describing: gino(artDetailInfo?.price!))
        lilcense = artDetailInfo?.artLicense!
        width = artDetailInfo?.artWidth!
        height = artDetailInfo?.artHeight!
        sizeLabelText.text = "\(String(describing: width!))" + "*" + "\(String(describing: height!))"
        artArticleLabelText.text = artDetailInfo?.artMaterial!
        artFigureLabelText.text = artDetailInfo?.artExpression!
        
        
        if((artDetailInfo?.artSize)! < 2411){
            sizeImg.image = UIImage(named: "sizeS")
        } else if(((artDetailInfo?.artSize)! < 6609) && (artDetailInfo?.artSize)! >= 2411) {
            sizeImg.image = UIImage(named: "sizeM")
        } else if(((artDetailInfo?.artSize)! < 10628) && (artDetailInfo?.artSize)! >= 6609) {
            sizeImg.image = UIImage(named: "sizeL")
        } else {
            sizeImg.image = UIImage(named: "sizeXl")
        }
        
        if (lilcense ==  "저작자표시") {
            licenseImage.image = UIImage(named: "ccBy")
        } else if (lilcense == "저작자표시-동일조건변경표시") {
            licenseImage.image = UIImage(named: "ccBySaCopy")
        } else if (lilcense == "저작자표시-비영리") {
            licenseImage.image = UIImage(named: "ccByNc")
        } else if (lilcense == "저작자표시-비영리-동일조건변경허락") {
            licenseImage.image = UIImage(named: "ccByNcSa")
        } else if (lilcense == "저작자표시-변경금지") {
            licenseImage.image = UIImage(named: "ccByNd")
        } else if (lilcense == "저작자표시-비영리-변경금지") {
            licenseImage.image = UIImage(named: "ccByNcNd")
        }

        
        //좋아요를 이미 눌렀을 경우i
         if (artDetailInfo?.artIsLike == true) {
        
           print("이미 눌렸다구요!")
        heartImg.setImage(UIImage(named:"heartColor"), for: .normal)
         }else {
         heartImg.setImage(UIImage(named:"heartGray"), for: .normal
         )
        }
 
        //판매자라면
        if (artDetailInfo?.auth == true) {
            figureLabel?.isHidden = true
        } else {
            figureLabel?.isHidden = false
        }
        
        if (artDetailInfo?.artPurchaseState == 0){
            buyBtn.setImage(UIImage(named:"artworkBuyGray"), for: .normal)
            priceImage.image = UIImage(named: "artworkPriceGray")
        } else if (artDetailInfo?.artPurchaseState == 1){
            buyBtn.setImage(UIImage(named:"artworkBuyColor"), for: .normal)
            priceImage.image = UIImage(named: "artworkPriceColor")
        } else {
            buyBtn.setImage(UIImage(named:"artworkComplete"), for: .normal)
            priceImage.image = UIImage(named: "artworkPriceGray")
            buyBtn.isEnabled = false
        }
        
        setUpData(completion: setUI)
    }
    
    func heartDetail(){
       
            moreImg.imageFromUrl(gsno(artDetailInfo?.artImg), defaultImgPath: "ggobuk")
            artNameLabel.text = likeDetailInfo?.artName!
            artLikeCountLabel.text = String(describing: gino(artDetailInfo?.likeCount!))
            desc?.text = artDetailInfo?.workDetail!
            artYearLabel.text = artDetailInfo?.artYear!
            artPriceLabel.text = String(describing: gino(artDetailInfo?.price!))
            lilcense = artDetailInfo?.artLicense!
            
            if (lilcense ==  "저작자표시") {
                licenseImage.image = UIImage(named: "ccBy")
            } else if (lilcense == "저작자표시-동일조건변경표시") {
                licenseImage.image = UIImage(named: "ccBySaCopy")
            } else if (lilcense == "저작자표시-비영리") {
                licenseImage.image = UIImage(named: "ccByNc")
            } else if (lilcense == "저작자표시-비영리-동일조건변경허락") {
                licenseImage.image = UIImage(named: "ccByNcSa")
            } else if (lilcense == "저작자표시-변경금지") {
                licenseImage.image = UIImage(named: "ccByNd")
            } else if (lilcense == "저작자표시-비영리-변경금지") {
                licenseImage.image = UIImage(named: "ccByNcNd")
            }
        
        
            //좋아요를 이미 눌렀을 경우i
            if (artDetailInfo?.artIsLike == true) {
                heartImg.setImage(UIImage(named:"heartColor"), for: .normal)
            }else {
                heartImg.setImage(UIImage(named:"heartGray"), for: .normal
                )
            }
        
        //artDetailInfo?.artIsLike = likeDetailInfo?.artIsLike
        
    }
    
    func setHeart(completion: @escaping() -> Void){
        print(sendArtIndex)
        let user_idx = artDetailInfo?.userIndex!
        CheckLikeService.shared.like(art_index: sendArtIndex!, user_index: user_idx! ) { (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status {
            case 200:
                if let allArtData = data.data {
                    //서버데이터를 todayList에 담아줌
                    print("\(allArtData)") //-> 사실은 setUI함수가 호출되는 것이다.
                    print("다음은 하트 정보")
                    self.artDetailInfo = allArtData
                    //데이터이동
                    completion()
                }
            case 401:
                print("회원 인증 실패")
            case 500:
                self.view.makeToast("네트워크 통신이 원활하지 않습니다")
            default:
                print("hi")
            }
        }
        
    }
    
    //댓글 조회
    func setUpData(completion: @escaping() -> Void){
        
        //let artIndex = sendArtIndex
        
        CheckCommentsService.shared.comments(art_index: sendArtIndex!){
            (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status{
            case 200:
                if let allCommentsData = data.data {
                    self.commentsList = allCommentsData
                    print("\(allCommentsData)")
                    completion()
                }
            case 204:
                print("유저가 쓴 댓글이 없음")
            case 500:
                print("서버 내부 에러")
            default:
                print("댓글조회")
            }
        }
    }
    
    func setUI(){
        self.commentsTable.reloadData()
    }
    
    func moveBuyVC(completion: @escaping() -> Void)
    {
        
        ArtDescriptionService.shared.artDescription(art_index: sendArtIndex!) { (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status {
            case 200:
                if let allArtData = data.data {
                    //서버데이터를 todayList에 담아줌
                    print("\(allArtData)") //-> 사실은 setUI함수가 호출되는 것이다.
                    self.artDetailInfo = allArtData
                    //데이터이동
                    completion()
                }
            case 400:
                print("나는 400이다")
            case 500:
                self.view.makeToast("네트워크 통신이 원활하지 않습니다")
            default:
                print("hi")
            }
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let update = UIAlertAction(title: "수정하기", style: .default, handler: nil)
        let delete = UIAlertAction(title: "삭제하기", style: .default, handler: nil)
        
        alert.addAction(update)
        alert.addAction(delete)
        
        present(alert, animated: true)
        
        func del(){
            print("wfjwfjwof")
        }
    }
    
    

}

extension BuyVC: UITableViewDelegate, UITableViewDataSource, CommentsTableCellDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = commentsTable.dequeueReusableCell(withIdentifier: "commentsCell") as! CommentsTableCell
        
        cell.delegate = self
        
        let comment = commentsList[indexPath.row]
        
        cell.commentsContentTF.text = gsno(comment.commentsText)
        //cell.commen
        cell.userName.text = gsno(comment.commentsName)
        return cell
    }
    
    //삭제버튼 눌렀을 때
    func deleteTapped(_ sender: CommentsTableCell){
        guard let indexPath = commentsTable.indexPath(for: sender) else { return }
        
        var commentsUser: Int?
        commentsUser = commentsList[indexPath.row].commentIndex!
        print(commentsUser)
        DeleteCommentService.shared.delete(comment_index: commentsUser!){
            (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status{
            case 200:
                self.commentsList.remove(at: indexPath.row)
                self.commentsTable.reloadData()
            case 401:
                print("인증 실패")
            case 404:
                print("댓글이 존재하지 않습니다")
            default: print("댓글 삭제 기능")
            }
            
        }
    }
    
}


//테이블 뷰에 서버에서 전달해주는 데이터 전해주기.



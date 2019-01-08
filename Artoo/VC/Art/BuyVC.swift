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
    
    //작품 표현기법, 재료 등이 표시되어야 함 -> 서버에서 정보를 불러올 것.
    var images = ""
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var artDetailInfo: ArtWork?
    var textHolder = ""
    var comments: String?
    var sendArtIndex: Int?
    var userIndex: Int?
    var commentsList : [Comments] = [] //코멘트 테이블 뷰를 위한 댓글 리스트
    @IBOutlet weak var commentsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedContentTV?.delegate = self
        
        setDetail()

        //처음에는 안 보이게 한다
        desc?.delegate = self
        artFigureLabel.isHidden = true
        artFigureLabelText.isHidden = true
        artArticleLabel.isHidden = true
        artArticleLabelText.isHidden = true
//        artFigureLabelText.text = artDetailInfo?.artExpression!
//        artArticleLabelText.text = artDetailInfo?.artMaterial!
        figureLabel?.isHidden = false
        
        //이미지 선택 시
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(BuyVC.bigImage))
        moreImg.addGestureRecognizer(pictureTap)
        moreImg.isUserInteractionEnabled = true
        setUpData(completion: setUI)
        commentsTable.delegate = self
        commentsTable.dataSource = self
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        //댓글 창을 처음 딱 닿으면 기존 값 없애기
        if feedContentTV?.isFirstResponder == true {
            feedContentTV?.text = ""
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
            }
            self.view.makeToast("댓글 작성 성공")
            case 400:
            self.view.makeToast("댓글을 작성하고 저장버튼을 눌러주세요")
            default: print("댓글 설정 부분")
                
            }
        }
        
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
    
    func setUpData(completion: @escaping() -> Void){
        
        let artIndex = artDetailInfo?.artIndex!
        CheckCommentsService.shared.comments(art_index: artIndex!){
            (data) in guard let status = data.status else { return }
            
            print(status)
            
            switch status{
            case 200:
                if let allCommentsData = data.data {
                    self.commentsList = allCommentsData
                    print("\(allCommentsData)")
                    completion()
                    print("hello")
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
}

extension BuyVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = commentsTable.dequeueReusableCell(withIdentifier: "commentsCell") as! CommentsTableCell
        
        let comment = commentsList[indexPath.row]
        
        cell.commentsContent.text = comment.commentsText!
        //이거 어케 쓰는지 물어보기
        
        
        cell.userName.text = comment.commentsName!

        return cell
    }

    
    
}

//테이블 뷰에 서버에서 전달해주는 데이터 전해주기.


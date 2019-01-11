//
//  MyPageReviewVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit


class MyPageReviewVC: UIViewController {
    var reviewInfo: [MyReview]?

    @IBOutlet weak var reviewTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setData(completion: setUI)

    }


}



extension MyPageReviewVC: UITableViewDelegate {
    
}
extension MyPageReviewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count =  reviewInfo?.count else { return 1}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell") as! MyPageReviewCell
        
        guard let data = reviewInfo?[indexPath.row] else { return UITableViewCell() }
        
        cell.reviewImg.imageFromUrl(gsno(data.aPicURL), defaultImgPath: "")
        cell.reviewImg.roundImage(num: 0.08)
        
        cell.reviewItem.text = gsno(data.aName)
        cell.reviewBuyer.text = gsno(data.uName)
        cell.reviewText.text = gsno(data.pComment)
        cell.reviewDate.text = gsno(data.pDate)

        return cell
    }
}

extension MyPageReviewVC{
        
    func setUI(){
        reviewTable.reloadData()
        reviewTable.dataSource = self
        reviewTable.delegate = self
    }
    
    func setData(completion: @escaping() -> Void){
        let userIdx = UserDefaults.standard.integer(forKey: "userIndex")
        print("\(userIdx)")
        MyPageReviewService.shared.getReviewList(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 201:
                guard let reviewData = data.data else { return }
                self.reviewInfo = reviewData
                print("\(reviewData)")
                completion()
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
}


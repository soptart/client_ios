//
//  MyPageReviewVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

var reviews: [reviewData] = []

class MyPageReviewVC: UIViewController {
    
    @IBOutlet weak var reviewTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setData()
        reviewTable.delegate = self
        reviewTable.dataSource = self

    }


}

extension MyPageReviewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell") as! MyPageReviewCell
        
        let review = reviews[indexPath.row]
        
        cell.reviewImg.image = UIImage(named: review.reviewImg)
        cell.reviewItem.text = review.reviewItem
        cell.reviewBuyer.text = review.buyer
        cell.reviewDate.text = review.reviewDate
        cell.reviewText.text = review.reviewText
        
        return cell
    }
}

extension MyPageReviewVC{
        
        func setData(){
            let review1 = reviewData(reviewImg:"01", reviewItem: "hell", buyer: "배선영", reviewText: "좋아요 최고에요, 번창하세요", reviewDate: "2019.01.03")
            
            reviews = [review1]
        }
}


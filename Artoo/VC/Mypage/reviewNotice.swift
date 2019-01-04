//
//  reviewNotice.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class reviewNotice: UIViewController {

    @IBOutlet weak var reviewTF: UITextView!
    
    var reviewText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            if reviewTF.isFirstResponder == true {
                reviewTF.text = ""
            }
        }
        
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        reviewText = reviewTF.text!
    }

    @IBAction func okBtn(_ sender: Any) {
        dismiss(animated: true)
        textViewDidEndEditing(reviewTF)
        print(reviewText!)
    }
    

}

//
//  tagUploadVC.swift
//  Artoo
//
//  Created by 보윤 on 02/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class tagUploadVC: UIViewController {

    var hashTag = [String]()
    
    @IBOutlet weak var tagName1: UIButton!
    @IBOutlet weak var tagName2: UIButton!
    @IBOutlet weak var tagName3: UIButton!
    @IBOutlet weak var tagName4: UIButton!
    @IBOutlet weak var tagName5: UIButton!
    @IBOutlet weak var tagName6: UIButton!
    @IBOutlet weak var tagName7: UIButton!
    @IBOutlet weak var tagName8: UIButton!
    @IBOutlet weak var tagName9: UIButton!
    @IBOutlet weak var tagName10: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishBtn(_ sender: Any) {
        
        dismiss(animated: true)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backSegue" {
            //객체 만들어주고
            let addTagVC = segue.destination as! UploadMainVC
            addTagVC.uploadTagBtn.setTitle("뭘까요", for: .normal)
        }
    }
    
    //해시태그 버튼눌렀을 때 배열에 값을 저장해서 넘겨주자
    
    @IBAction func choiceTagBtn(_ sender: UIButton) {
        
        if(sender.tag == 1){
            hashTag.append(tagName1.titleLabel!.text!)
        } else if (sender.tag == 2){
            hashTag.append(tagName2.titleLabel!.text!)
        } else if (sender.tag == 3){
            hashTag.append(tagName3.titleLabel!.text!)
        } else if (sender.tag == 4) {
            hashTag.append(tagName4.titleLabel!.text!)
        } else if (sender.tag == 5) {
             hashTag.append(tagName5.titleLabel!.text!)
        } else if (sender.tag == 6){
            hashTag.append(tagName6.titleLabel!.text!)
        } else if (sender.tag == 7) {
            hashTag.append(tagName7.titleLabel!.text!)
        } else if (sender.tag == 8){
            hashTag.append(tagName8.titleLabel!.text!)
        } else if (sender.tag == 9){ hashTag.append(tagName9.titleLabel!.text!)
            
        } else {
          hashTag.append(tagName10.titleLabel!.text!)
        }
        
    }
    
    
}

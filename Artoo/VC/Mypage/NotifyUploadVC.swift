//
//  NotifyUploadVC.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class NotifyUploadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
 
    @IBAction func OkBtn(_ sender: Any) {
        
        /*
          guard let uploadVC = storyboard?.instantiateViewController(withIdentifier: "uploadMain") as? UploadMainVC else{ return }
        /*
        dismiss(animated: true, completion: {()-> Void in self.present(uploadVC, animated: true, completion: nil)})
        */
        
        guard let moveVC = storyboard?.instantiateViewController(withIdentifier: "no_art") as? NoArtVC else { return }
        
        self.dismiss(animated: true, completion: {()-> Void in moveVC.navigationController?.pushViewController(uploadVC, animated: true)})
        */

        self.dismiss(animated: true)
     
        }

    }

        /*
    func move() {
        
        guard let uploadVC = storyboard?.instantiateViewController(withIdentifier: "uploadMain") as? UploadMainVC else{ return }
        navigationController?.pushViewController(uploadVC, animated: true)
    }*/

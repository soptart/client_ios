//
//  exhibitListVC.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class exhibitListVC: UITableViewController {

    var exhibitInofrmation: [exhibitInfo] = []
    
    @IBOutlet var exhibitTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exhibitInofrmation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = exhibitTable.dequeueReusableCell(withIdentifier: "exhibitList") as! exhibitListCell
        
        
        let exhibit = exhibitInofrmation[indexPath.row]
        
        cell.exhibitTitle.text = exhibit.exhibitTitle!
        cell.exhibitDate.text = exhibit.exhibitDate!
        cell.author.text = exhibit.author!
        cell.artName.text = exhibit.artName!
        
        return cell
    }

    @IBAction func cancelBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "exhibitCancelSegue", sender: self)
    }
}

extension exhibitListVC{
    
    func setData(){
        let exhibit1 = exhibitInfo(exhibitTitle: "익숙함이 새로움", exhibitDate: "2019.01~2019.04", author: "최윤정", artName: "아투짱짱")
        
        let exhibit2 = exhibitInfo(exhibitTitle: "새로운 익숙함", exhibitDate: "2019.02~2019.03", author: "배선영", artName: "대상 가즈아")
        
        exhibitInofrmation = [exhibit1, exhibit2]
    }
}

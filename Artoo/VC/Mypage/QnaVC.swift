//
//  QnaVC.swift
//  Artoo
//
//  Created by 보윤 on 04/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class QnaVC: UIViewController {

    var Qnas = [Qna]()
    
    @IBOutlet weak var QnaTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        QnaTable.dataSource = self
        QnaTable.delegate = self
        QnaTable.tableFooterView = UIView() // Removes empty cell separators
        QnaTable.estimatedRowHeight = 60
        QnaTable.rowHeight = UITableView.automaticDimension
        setData()
        
    }
    
}

extension QnaVC{
    func setData(){
        
        let q1 = Qna(title: "Artoo는 무슨 앱인가요?", subtitle: "미술전공자들의 작품을 공유하며 댓글로 도움을주고 작품을 전시하며 판매할 수 있는 앱 입니다.")
        
        Qnas = [q1]
    }
    
}

extension QnaVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Qnas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QnaTable.dequeueReusableCell(withIdentifier: String(describing: Qna.self), for: indexPath) as! QnaCell
        
        cell.set(content: Qnas[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = Qnas[indexPath.row]
        content.expanded = !content.expanded
        QnaTable.reloadRows(at: [indexPath], with: .automatic)
       
    }
    
}

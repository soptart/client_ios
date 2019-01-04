//
//  BuyItem.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import UIKit

struct BuyItem {
    
    var artImg: UIImage?
    var artItem: String
    var buyer: String
    var price: String
    var date: String
    
    init(artName: String, artItem: String, buyer: String, price: String, date: String) {
        
        self.artImg = UIImage(named: artName)
        self.artItem = artItem
        self.buyer = buyer
        self.price = price
        self.date = date
    }
}

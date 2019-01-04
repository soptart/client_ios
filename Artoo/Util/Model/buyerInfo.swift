//
//  buyerInfo.swift
//  Artoo
//
//  Created by 보윤 on 03/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation

struct buyerInfo{
    var buyerName: String!
    var buyerNumber: String!
    var buyerAddress: String!
    var buyerDetailAddress: String!
    
    
    init(buyerName: String, buyerNumber: String, buyerAddress: String){
      self.buyerName = buyerName
      self.buyerNumber = buyerNumber
      self.buyerAddress = buyerAddress
    }
    
    init(buyerName: String, buyerNumber: String, buyerDetailAddress: String){
        self.buyerName = buyerName
        self.buyerNumber = buyerNumber
        self.buyerDetailAddress = buyerDetailAddress
    }
}

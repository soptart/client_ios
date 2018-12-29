//
//  File.swift
//  Artoo
//
//  Created by 홍정민 on 2018. 12. 29..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation


//delegate : 어떤 객체가 할 일을 일부분적으로 확장해서 대신 처리
//두 가지 : 대신 해줄 객체 <-> 처리하라고 시키는 객체
protocol RadioBtnDelegate {
    func selectRadioBtn(at indexPath:IndexPath)
}

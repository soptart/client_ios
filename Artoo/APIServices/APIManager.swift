//
//  APIManager.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//


protocol APIManager {}

extension APIManager {
    static func url(_ path: String) -> String {
        return "13.209.128.210:8080/" + path
    }
}

//
//  NetworkResult.swift
//  Artoo
//
//  Created by 홍정민 on 2019. 1. 1..
//  Copyright © 2019년 홍정민. All rights reserved.
//


enum NetworkResult<T> {
    case success(T)
    case error(Error)
}

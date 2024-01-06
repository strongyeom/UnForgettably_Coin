//
//  DummyDataModel.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import Foundation

struct DummyDataModel: Hashable {
    let name: [String]
    
    init() {
        let dataList = Array(1...100).map { "목록 \($0)"}
        self.name = dataList
    }
}

//
//  CoinMarket.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import Foundation

struct CoinMarket: Codable, Hashable {
    let market: String
    let koreanName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

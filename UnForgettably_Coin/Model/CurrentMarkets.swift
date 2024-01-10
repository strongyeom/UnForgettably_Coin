//
//  CurrentMarkets.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/10/24.
//

import Foundation

struct CurrentMarkets: Decodable, Hashable {
    let market: String
    let trade_price: Double
    let trade_volume: Double
    let prev_closing_price: Double
    let change_price: Double
}

struct MatchMarketName: Hashable {
    let marketName: String
    let marketInfo: CurrentMarkets
}

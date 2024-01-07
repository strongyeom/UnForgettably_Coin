//
//  CurrentCoinValue.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import Foundation

struct CurrentCoinValue: Decodable, Hashable {
    let opening_price: Double
    let high_price: Double
    let low_price: Double
    let trade_price: Double
    let acc_trade_price_24h: Double
    let acc_trade_volume_24h: Double
}

//
//  Trade.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/8/24.
//

import Foundation

struct Trade: Decodable, Hashable {
    let trade_price: Double
    let trade_volume: Double
    let prev_closing_price: Double
    let change_price: Double
    
    // 전일 대비 퍼센트
    var comparedToThePreviousDayPersent: String {
        return String(format: "%.2f", (trade_price / prev_closing_price)) + "%"
    }

    // 체결 가격
    var changePriceToFormatted: String {
        return self.trade_price.formatted() + "원"
    }
    
    // 전일 대비 변화 금액
    var calPreToCurrentPrice: Double {
        return self.trade_price - self.prev_closing_price
    }
    
    // 체결량 소수점 3자리까지
    var roundedVolume: String {
        let filter = (trade_volume * 100) / 10
        let aa = String(format: "%.3f", filter)
        
        return aa
    }

}

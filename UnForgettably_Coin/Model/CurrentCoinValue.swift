//
//  CurrentCoinValue.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import Foundation

struct CurrentCoinValue: Decodable, Hashable {
    let opening_price: Double?
    let high_price: Double?
    let low_price: Double?
    let trade_price: Double?
    let acc_trade_price_24h: Double?
    let acc_trade_volume_24h: Double?
    let prev_closing_price: Double?
    
    let highest_52_week_price: Double?
    let highest_52_week_date: String?
    let lowest_52_week_price: Double?
    let lowest_52_week_date: String?
    
    var kstFilterOpen: String {
        return (self.opening_price ?? 0.0).formatted()
    }
    
    var kstFilterHigh: String {
        return (self.high_price ?? 0.0).formatted()
    }

    var kstFilterLow: String {
        return (self.low_price ?? 0.0).formatted()
    }
    
    var kstFilterTrade: String {
        return (self.trade_price ?? 0.0).formatted()
    }
    
    var kstFilterHigh52Price: String {
        return (self.highest_52_week_price ?? 0.0) .formatted()
    }
    
    var kstFilterLow52Price: String {
        return (self.lowest_52_week_price ?? 0.0).formatted()
    }
    
    var kstFilterPrice24h: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: self.acc_trade_price_24h) ?? "0"
        return result
    }
    
    var kstFilterVolume24h: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: self.acc_trade_volume_24h) ?? "0"
        return result
    }
    
  
}

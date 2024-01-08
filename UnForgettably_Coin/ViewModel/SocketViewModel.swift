//
//  SocketViewModel.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import SwiftUI
import Combine

class SocketViewModel : ObservableObject {
    
    @Published var tikcerList: CurrentCoinValue = CurrentCoinValue(opening_price: 0, high_price: 0, low_price: 0, trade_price: 0, acc_trade_price_24h: 0, acc_trade_volume_24h: 0, prev_closing_price: 0)
    @Published var tradeList: Trade = Trade(trade_price: 0, trade_volume: 0, prev_closing_price: 0, change_price: 0)
    
    
    
    @Published var chartValues: [ChartComponets] = []
    @Published var minChartValues: Double = 0.0
    @Published var maxChartValues: Double = 0.0
    
    private var cancelable = Set<AnyCancellable>()
    
    func fetchWebSocket(selectedCoin: String) {
        print("SocketViewModel init")
        WebSocketManager.shared.openWebSocket()
        WebSocketManager.shared.send(selectedCoin)
        
        WebSocketManager.shared.currentCoinValues
            .receive(on: DispatchQueue.main)
            .sink { [weak self] order in
                guard let self else { return }
                self.tikcerList = order
                self.chartValues.append(ChartComponets(date: .now, value: order.trade_price))
                self.minChartValues = chartValues.map { $0.value}.sorted(by: <).first ?? 0.0
                self.maxChartValues = chartValues.map { $0.value}.sorted(by: <).last ?? 0.0
                print("chartValues - \(chartValues)")
            }
            .store(in: &cancelable)
        
        
        WebSocketManager.shared.tradeCoinValues
            .receive(on: DispatchQueue.main)
            .sink { [weak self] trade in
                print("Trade - \(trade)")
                self?.tradeList = trade
            }
            .store(in: &cancelable)
    }
    
    

    deinit {
        print("SocketViewMdoel deinit")
        WebSocketManager.shared.closeWebSocket()
        self.chartValues = []
    }

}

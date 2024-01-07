//
//  SocketViewModel.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import SwiftUI
import Combine

class SocketViewModel : ObservableObject {
    
    @Published var tikcerList: CurrentCoinValue = CurrentCoinValue(opening_price: 0, high_price: 0, low_price: 0, trade_price: 0, acc_trade_price_24h: 0, acc_trade_volume_24h: 0)
    @Published var chartValues: [ChartComponets] = []
    
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
                print("chartValues - \(chartValues)")
            }
            .store(in: &cancelable)
    }

    deinit {
        print("SocketViewMdoel deinit")
        WebSocketManager.shared.closeWebSocket()
        self.chartValues = []
    }

}

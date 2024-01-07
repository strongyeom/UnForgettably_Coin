//
//  CoinDetailView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI
import Charts

struct CoinDetailView: View {

    @StateObject var webSocketViewModel = SocketViewModel()
   
    var selectedCoinInfo : CoinMarket
    
    var body: some View {
        
        VStack {
            
            currentCoinValue
            
                Chart {
                    ForEach(webSocketViewModel.chartValues, id:\.self) { item in
                        
                        BarMark(x: .value("Date", item.date),
                                 y: .value("Value", item.value))
                    }
                    .foregroundStyle(.blue)
                }
                .padding(30)
                .chartScrollableAxes(.horizontal)
                .chartYScale(domain: webSocketViewModel.tikcerList.trade_price * 0.997 ... webSocketViewModel.tikcerList.trade_price * 1.003)
            
        }
        .navigationTitle(selectedCoinInfo.koreanName)
        .navigationBarTitleDisplayMode(.large)
        .padding()
        .onAppear {
            webSocketViewModel.fetchWebSocket(selectedCoin: selectedCoinInfo.market)
        }
    }
 
    
    var currentCoinValue: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\(webSocketViewModel.tikcerList.kstFilterTrade)원")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.red)
                .lineLimit(2)
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 10) {
                    Text("고가")
                        .frame(width: 80, alignment: .leading)
                    Text(webSocketViewModel.tikcerList.kstFilterHigh)
                        .foregroundStyle(.red)
                        .minimumScaleFactor(0.5)
                        .bold()
                        .lineLimit(1)
                }
                
                HStack(spacing: 10) {
                    Text("저가")
                        .frame(width: 80, alignment: .leading)
                    Text(webSocketViewModel.tikcerList.kstFilterLow)
                        .foregroundStyle(.blue)
                        .minimumScaleFactor(0.5)
                        .bold()
                        .lineLimit(1)
                }
                HStack(spacing: 10) {
                    Text("거래량24H")
                        .frame(width: 80, alignment: .leading)
                    Text(webSocketViewModel.tikcerList.kstFilterVolume24h)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
                
                HStack(spacing: 10) {
                    Text("거래대금24H")
                        .frame(width: 80, alignment: .leading)
                    Text(webSocketViewModel.tikcerList.kstFilterPrice24h)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
            }
       
        }
        .background(.green)
        .font(.caption2)
    }
}

//#Preview {
//    CoinDetailView(selectedText: "")
//}

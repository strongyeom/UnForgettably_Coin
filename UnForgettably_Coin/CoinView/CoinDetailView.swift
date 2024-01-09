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
    @State private var scroll: Double = 0
    var selectedCoinInfo : CoinMarket
    
    var body: some View {
        
        VStack {
            
            currentCoinValue
            nowNews
            coinChart
            
            
        }
        .navigationTitle(selectedCoinInfo.koreanName)
        .navigationBarTitleDisplayMode(.large)
        .padding()
        .onAppear {
            webSocketViewModel.fetchWebSocket(selectedCoin: selectedCoinInfo.market)
        }
    }
    // 코인 상세 정보 및 금액
    var currentCoinValue: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(.blue, lineWidth: 1.0)
            .overlay {
                HStack(alignment: .top, spacing: 10) {
                    Text("\(webSocketViewModel.tikcerList.kstFilterTrade)원")
                        .font(.title2)
                        .fontWeight(.bold)
                    //                .foregroundStyle(.red)
                        .lineLimit(2)
                        .foregroundStyle(webSocketViewModel.tikcerList.trade_price > webSocketViewModel.tikcerList.prev_closing_price ? .red : .blue)
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
                .padding()
                .font(.caption2)
            }
    }
    
    // 실시간 선택된 뉴스
    var nowNews: some View {
        Rectangle()
            .stroke(.white)
            .overlay {
                GeometryReader { proxy in
                    let grapWidth = proxy.size.width * 0.6 // 챠트 최대 너비
                    
                    HStack(spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("전일대비")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text(webSocketViewModel.tradeList.comparedToThePreviousDayPersent)
                            
                            Text(webSocketViewModel.tradeList.calPreToCurrentPrice.formatted())
                                .foregroundStyle(webSocketViewModel.tradeList.calPreToCurrentPrice > 0 ? .red : .blue)
                        }
                        .padding()
                        .background(.gray)
                        .clipShape(.rect(cornerRadius: 14))
                        .frame(width: proxy.size.width * 0.3)
                        
                        VStack(alignment: .trailing) {
                            
                            VStack(alignment: .trailing) {
                                Text("체결가격")
                                    .font(.caption2)
                                Text(webSocketViewModel.tradeList.changePriceToFormatted)
                            }
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("체결량")
                                    .font(.caption2)
                                ZStack(alignment: .trailing) {
                                    
                                    let graphSize = CGFloat(webSocketViewModel.tradeList.trade_volume) / CGFloat(webSocketViewModel.largestMaxValues > 0 ? webSocketViewModel.largestMaxValues : 0.1) * grapWidth
                                    
                                    Rectangle()
                                        .foregroundStyle(.blue.opacity(0.4))
                                        .frame(width: graphSize)
                                    
                                    Text("\((webSocketViewModel.tradeList.roundedVolume))")
                                    
                                    
                                    
                                }
                            }
                            .frame(width: grapWidth, alignment: .trailing)
                        }
                    }
                    .padding()
                }
            }
    }
    
    // 챠트
    var coinChart: some View {
        Chart {
            ForEach(webSocketViewModel.chartValues, id:\.self) { item in
                
                LineMark(x: .value("Date", item.date),
                         y: .value("Value", item.value))
            }
            .foregroundStyle(.coinGraph)
        }
        .padding(30)
        .chartScrollableAxes(.horizontal)
        .chartScrollPosition(x: $scroll)
        .chartYScale(domain: webSocketViewModel.minChartValues ... webSocketViewModel.maxChartValues)
        .frame(height: UIScreen.main.bounds.height * 0.5)
        
        
    }
    
    
}

//#Preview {
//    CoinDetailView(selectedText: "")
//}

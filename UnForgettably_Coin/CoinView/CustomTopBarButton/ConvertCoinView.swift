//
//  KRWToBTCView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/9/24.
//

import SwiftUI

struct ConvertCoinView: View {
    
    var krw_Info: [MatchMarketName]
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.adaptive(minimum: .infinity / 2)), GridItem(.adaptive(minimum: .infinity / 2))
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                
                LazyVGrid(columns: columns) {
                    
                    ForEach(krw_Info, id: \.self) { market in
                        NavigationLink(
                            destination: {
                                CoinDetailView(selectedCoinInfo: market)
                            },
                            label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.linearGradient(Gradient(colors: [.yellow, .coinGraph]), startPoint: .topLeading, endPoint: .bottomTrailing)) // arrowtriangle.up.fill , arrowtriangle.down.fill
                                    .overlay {
                                        VStack(alignment: .center) {
                                            BitCoinImageView(bitCoinTitmeName: String(market.marketInfo.market.split(separator: "-").last!))
                                                .frame(width: 50, height: 50)
                                                .padding(.bottom, 7)
                                            Text("\(market.marketName)")
                                                .font(.caption)
                                            Text("\(market.marketInfo.trade_price.formatted())원")
                                                .font(.title2)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.5)
                                                .foregroundStyle(.black)
                                                .padding(.bottom, 13)
                                            Text(market.marketInfo.comparedToThePreviousDayPersent)
                                                .foregroundStyle(market.marketInfo.comparedToThePreviousDayPersent.first == "-" ? .blue : .red)
                                                .font(.caption)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding()
                                    }
                                    .frame(height: proxy.size.width / 2)
                            }
                        )
                        
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ConvertCoinView(krw_Info: [])
}

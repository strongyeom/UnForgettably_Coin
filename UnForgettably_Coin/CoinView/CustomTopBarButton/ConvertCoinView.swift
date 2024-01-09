//
//  KRWToBTCView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/9/24.
//

import SwiftUI

struct ConvertCoinView: View {
    
    var krw_Info: [CoinMarket]
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.adaptive(minimum: .infinity / 2)), GridItem(.adaptive(minimum: .infinity / 2))
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                
                LazyVGrid(columns: columns) {
                    
                    ForEach(krw_Info, id: \.self) { market in
//                        NavigationLink(value: market) {
//                            RoundedRectangle(cornerRadius: 12)
//                                .fill(.yellow)
//                                .overlay {
//                                    
//                                    VStack {
//                                        Text("\(market.koreanName)")
//                                        Text("\(market.englishName)")
//                                        Text("\(market.market)")
//                                    }
//                                   
//                                    
//                                }
//                                .frame(height: proxy.size.width / 2)
//                        }
                        NavigationLink(
                            destination: {
                                CoinDetailView(selectedCoinInfo: market)
                            },
                            label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.yellow)
                                    .overlay {
                                        
                                        VStack {
                                            Text("\(market.koreanName)")
                                            Text("\(market.englishName)")
                                            Text("\(market.market)")
                                        }
                                       
                                        
                                    }
                                    .frame(height: proxy.size.width / 2)
                            }
                        )
                    }
                }
//                .navigationDestination(for: CoinMarket.self) { data in
//                    CoinDetailView(selectedCoinInfo: data)
//                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ConvertCoinView(krw_Info: [])
}

/*
 ScrollView {
 LazyVGrid(columns: columns) {
 
 ForEach(searchFilterCoinList, id: \.self) { market in
 NavigationLink(value: market) {
 Capsule()
 .fill(.yellow)
 .overlay {
 VStack {
 Text("\(market.koreanName)")
 Text("\(market.englishName)")
 Text("\(market.market)")
 }
 
 }
 .frame(height: 60)
 }
 }
 }
 .padding()
 .navigationDestination(for: CoinMarket.self) { data in
 CoinDetailView(selectedCoinInfo: data)
 }
 }
 */

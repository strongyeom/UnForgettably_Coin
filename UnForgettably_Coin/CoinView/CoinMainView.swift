//
//  CoinMainView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct CoinMainView: View {

    let dummyModel = DummyDataModel()
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    
    
    @State private var searchText = ""
    @StateObject var coinViewModel = CoinListViewModel()
    
    var searchFilterCoinList: [CoinMarket] {
        return searchText.isEmpty ? coinViewModel.coinMarket : coinViewModel.coinMarket.filter { $0.koreanName.contains(searchText)}
    }
    
    var body: some View {
            ScrollView {
                VStack {
                    TextField("코인명을 입력해주세요.", text: $searchText)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .overlay {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 10)
                        }
                        .padding(.horizontal, 10)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                        LazyVGrid(columns: columns) {
                            
                            ForEach(searchFilterCoinList, id: \.self) { market in
                                NavigationLink(value: market) {
                                    Capsule()
                                        .fill(.yellow)
                                        .overlay {
                                            Text("\(market.koreanName)")
                                        }
                                        .frame(height: 60)
                                }
                            }
                        }
                        .padding()
                        .navigationDestination(for: CoinMarket.self) { data in
                            CoinDetailView(selectedText: data)
                        }
                    }
                }
            } // ScrollView
            .onSubmit(of: .text) {
                print("검색어 \(searchText)")
                searchText = ""
            }
         
        
    }
}

#Preview {
    CoinMainView()
}

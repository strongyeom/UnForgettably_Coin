//
//  CoinMainView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct CoinMainView: View {
  
    @State private var searchText = ""
    @State var tabIndex = 0
    @StateObject var coinViewModel = CoinListViewModel()
    
    var searchFilterCoinList: [MatchMarketName] {
        return searchText.isEmpty ? coinViewModel.matchMarket : coinViewModel.matchMarket.filter { $0.marketName.contains(searchText)}
    }
    var body: some View {
        
        VStack {
            TextField("코인명을 입력해주세요.", text: $searchText)
                .modifier(TextFieldModifier())
            Spacer()
           
            VStack(spacing: 0){
                        CustomTopTabBar(tabIndex: $tabIndex)
                        
                ConvertCoinView(krw_Info: tabIndex == 0 ? searchFilterCoinList.filter { ($0.marketInfo.market.split(separator: "-").first ?? "") == "KRW" } : searchFilterCoinList.filter { ($0.marketInfo.market.split(separator: "-").first ?? "") == "BTC"})
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 24, alignment: .center)
                    .padding(.horizontal, 12)
        }
        .onSubmit(of: .text) {
            print("검색어 \(searchText)")
        }
    }
}
                                     
struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .textCase(.uppercase)
            .overlay {
                Image(systemName: "magnifyingglass")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
    }
}

#Preview {
    CoinMainView()
}

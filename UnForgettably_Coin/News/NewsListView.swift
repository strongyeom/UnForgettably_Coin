//
//  NewsListView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject var naverNewsViewModel = NaverViewModel()
    
    var body: some View {
        VStack {
            List() {
                Section("주요뉴스") {
                    ForEach(naverNewsViewModel.naverNews, id: \.self) { dummy in
                        NavigationLink(value: dummy) {
                            Text("\(dummy.title)")
                                .font(.headline)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: Items.self) { naverItems in
                NewsWebView(naverData: naverItems)
            }
        }
    }
}

#Preview {
    NewsListView()
}

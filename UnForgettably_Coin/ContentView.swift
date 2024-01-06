//
//  ContentView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var naverNewsViewModel = NaverViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                NewsListView()
                CoinMainView()
            }
        } // NavigationStack
    }
}

#Preview {
    ContentView()
}

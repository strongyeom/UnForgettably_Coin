//
//  ContentView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NewsListView()
                CoinMainView()
            }
        } // NavigationStack
    }
}

#Preview {
    ContentView()
}

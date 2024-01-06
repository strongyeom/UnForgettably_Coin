//
//  CoinDetailView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct CoinDetailView: View {
    
    var selectedText : String
   
    var body: some View {
        Text("\(selectedText)")
    }
}

#Preview {
    CoinDetailView(selectedText: "")
}
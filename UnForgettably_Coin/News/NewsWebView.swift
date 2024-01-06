//
//  NewsWebView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct NewsWebView: View {
    
    var naverData: Items
    
    var body: some View {
        
        Link(destination: URL(string: "https://www.cbci.co.kr/news/articleView.html?idxno=456393")!) {
            Text("Safari App으로 이동해서 보여주기")
        }
    }
}

//#Preview {
//    NewsWebView(naverData: navern)
//}

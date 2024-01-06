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
            List {
                Section("주요뉴스") {
                    ForEach(naverNewsViewModel.naverNews, id: \.self) { dummy in
                        
                        let aa = dummy.link.replacingOccurrences(of: #"\"#, with: "")

                        
                        Link(destination: URL(string: aa)!, label: {
                            Text("\(dummy.title)")
                        })
                    } // ForEach
                } // Section
            } // List
            .listStyle(.plain)
            
        }
       
    }
}

#Preview {
    NewsListView()
}

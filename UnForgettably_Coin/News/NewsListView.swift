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
                    ForEach(naverNewsViewModel.naverNews, id: \.self) { data in
                        
                        let filterUrl = data.link.replacingOccurrences(of: #"\"#, with: "")
                        var filterTitle = data.title
                            .replacingOccurrences(of: "<b>", with: "")
                            .replacingOccurrences(of: "&quot;", with: "")
                            .replacingOccurrences(of: "</b>", with: "")
                        
                        
                        Link(destination: URL(string: filterUrl)!, label: {
                            Text(filterTitle)
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

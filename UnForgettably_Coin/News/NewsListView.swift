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
        VStack(alignment: .leading, spacing: 0) {
            Text("주요뉴스")
                .font(.title3)
                .foregroundStyle(.black)
                .bold()
                .padding(.horizontal, 20)
            List {
                    ForEach(naverNewsViewModel.naverNews, id: \.self) { data in
                        
                        let filterUrl = data.link.replacingOccurrences(of: #"\"#, with: "")
                        let filterTitle = data.title
                            .replacingOccurrences(of: "<b>", with: "")
                            .replacingOccurrences(of: "&quot;", with: "")
                            .replacingOccurrences(of: "</b>", with: "")
                        
                        
                        Link(destination: URL(string: filterUrl)!, label: {
                            Text(filterTitle)
                        })
                    } // ForEach
            } // List
            .listStyle(.plain)
        }
        .frame(height: UIScreen.main.bounds.height * 0.3)
       
    }
}

#Preview {
    NewsListView()
}

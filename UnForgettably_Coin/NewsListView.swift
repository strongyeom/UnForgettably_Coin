//
//  NewsListView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct NewsListView: View {
    
    let dummyList = ["123123", "fdfsddfsfsdf", "88484dffdsfsdf"]
    
    var body: some View {
        VStack {
            List {
                Section("주요뉴스") {
                    ForEach(dummyList, id: \.self) { dummy in
                        Text("\(dummy)")
                            .font(.headline)
                    }
                }
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .background(.green)
            .frame(height: 200)
        }
    }
}

#Preview {
    NewsListView()
}

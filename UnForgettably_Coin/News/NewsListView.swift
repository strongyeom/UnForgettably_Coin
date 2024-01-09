//
//  NewsListView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject var naverNewsViewModel = NaverViewModel()
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("주요 뉴스")
                .font(.title2)
                .fontWeight(.bold)
                .background(.red)
            
            TabView(selection: $currentPage) {
                ForEach(Array(zip(naverNewsViewModel.naverNews.indices, naverNewsViewModel.naverNews)), id:\.0) { index, data in
                    let filterUrl = data.link.replacingOccurrences(of: #"\"#, with: "")
                    Text(titleModifier(titleText: data.title))
                        .font(.title3)
                        .fontWeight(.semibold)
                        .background(.green)
                        .lineLimit(1)
                        .onTapGesture {
                            guard let url = URL(string: filterUrl) else { return }
                            UIApplication.shared.open(url)
                        }
                        .tag(index)
                }
            }
//            .tabViewStyle(PageTabViewStyle())
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
        }
        .background(.yellow)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding()
        .onAppear {
            startTimer()
        }
    }
    
    /*
     .onChange(of: currentPage) { _, _ in
         Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
             self.currentPage += 1
         }
     }
     */
    
    func titleModifier(titleText: String) -> String {
        let filterTitle = titleText
            .replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "&quot;", with: "")
            .replacingOccurrences(of: "</b>", with: "")
        return filterTitle
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            withAnimation(.smooth.speed(4.0)) {
                currentPage = (currentPage + 3) % naverNewsViewModel.naverNews.count
            }
        }
    }
    
}

#Preview {
    NewsListView()
}

/*
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
 */

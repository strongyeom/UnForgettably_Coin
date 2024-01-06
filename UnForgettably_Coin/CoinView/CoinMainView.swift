//
//  CoinMainView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI

struct CoinMainView: View {
    
    //목록을 1부터 1000까지 만듬
//    let dataList = Array(1...300).map { "목록 \($0)"}
    let dummyModel = DummyDataModel()
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                    LazyVGrid(columns: columns) {
                        
                        ForEach(dummyModel.name, id: \.self) { number in
                            NavigationLink(value: number) {
                                Capsule()
                                    .fill(.yellow)
                                    .overlay {
                                        Text("\(number)")
                                    }
                                    .frame(height: 60)
                            }
                        }
                    }
                    .padding()
                    .navigationDestination(for: String.self) { data in
                        CoinDetailView(selectedText: data)
                    }
                }
               
            }
           
        }
    }
}

#Preview {
    CoinMainView()
}

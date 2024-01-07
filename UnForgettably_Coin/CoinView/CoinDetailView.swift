//
//  CoinDetailView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import SwiftUI
import Charts

struct Data {
    let name: String = "jake"
    let date: Date
    let value: Int
}



struct CoinDetailView: View {
    
    let datas = [
        Data(date: .now, value: 10),
        Data(date: .now.addingTimeInterval(10), value: 5),
        Data(date: .now.addingTimeInterval(20), value: 15),
        Data(date: .now.addingTimeInterval(30), value: 8),
        Data(date: .now.addingTimeInterval(40), value: 9),
        Data(date: .now.addingTimeInterval(50), value: 5),
        Data(date: .now.addingTimeInterval(60), value: 15),
        Data(date: .now.addingTimeInterval(70), value: 8),
        Data(date: .now.addingTimeInterval(80), value: 9),
    ]
    
    var selectedText : CoinMarket
    
    var body: some View {
        
        VStack {
            
            currentCoinValue
            Chart {
                ForEach(datas, id:\.date) { item in
                    LineMark(x: .value("Date", item.date), y: .value("Value", item.value))
                        .symbol(by: .value("Value", item.value))
                        .symbolSize(40)
                }
                .foregroundStyle(.blue)
            }
            .chartScrollableAxes(.horizontal)
            
        }
        .navigationTitle(selectedText.koreanName)
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
    
    var currentCoinValue: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("20,000,000원")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.red)
                .lineLimit(1)
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 10) {
                    Text("고가")
                        .frame(width: 80, alignment: .leading)
                    Text("20,000,00")
                        .foregroundStyle(.red)
                        .minimumScaleFactor(0.5)
                        .bold()
                        .lineLimit(1)
                }
                
                HStack(spacing: 10) {
                    Text("저가")
                        .frame(width: 80, alignment: .leading)
                    Text("20,000,0090909999099090")
                        .foregroundStyle(.blue)
                        .minimumScaleFactor(0.5)
                        .bold()
                        .lineLimit(1)
                }
                HStack(spacing: 10) {
                    Text("거래량24H")
                        .frame(width: 80, alignment: .leading)
                    Text("20,000,0090909999099090원")
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
                
                HStack(spacing: 10) {
                    Text("거래대금24H")
                        .frame(width: 80, alignment: .leading)
                    Text("000,090,909,999,099,090원")
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
            }
       
        }
        .font(.caption2)
    }
}

//#Preview {
//    CoinDetailView(selectedText: "")
//}

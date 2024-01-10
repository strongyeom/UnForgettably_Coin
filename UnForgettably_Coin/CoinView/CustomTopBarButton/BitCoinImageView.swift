//
//  BitCoinImageView.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/10/24.
//

import SwiftUI

struct BitCoinImageView : View {
    
    var bitCoinTitmeName: String
    
    var body: some View {
        
        let url = URL(string: "https://static.upbit.com/logos/\(bitCoinTitmeName).png")
        
        VStack {
            // 🔴 서버에 응답이 없거나 URL이 잘못 된 경우???
            // AsyncImagePhase -> View로 구성되어 있는 AsyncImage 사용하여 에러 핸들링 가능
            AsyncImage(url: url) { data in
                // 각 단계별로
                switch data {
                case .empty:
                    // 이미지가 뜨기 전에 보여주는 부분
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .failure(_): // error를 사용하지 않기 때문에 생략 가능
                    // data(URL)가 잘못된 경우 기본 이미지 띄어주기
                    Image(systemName: "photo.artframe")
                @unknown default:
                    Image(systemName: "photo.artframe")
                }
            }
            
            
        }
       
    }
}
//
//#Preview {
//    BitCoinImageView()
//}

//
//  CoinListViewModel.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import SwiftUI

class CoinListViewModel : ObservableObject {
    
    @Published var coinMarket: [CoinMarket] = []
    
    init() {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            if let statusCode = response as? HTTPURLResponse {
                print("업비트 상태코드 : \(statusCode.statusCode)")
            }
            
            guard let data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([CoinMarket].self, from: data)
                DispatchQueue.main.async {
                    self.coinMarket = decodedData
                }
            } catch {
                print("디코딩 에러 \(error.localizedDescription)")
            }
            
        }
        .resume()
    }
}

//
//  CoinListViewModel.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import SwiftUI

final class CoinListViewModel : ObservableObject {
    
    private var coinMarket: [CoinMarket] = []
    private let dispatchGroup = DispatchGroup()
    private var coinNameArrayToString: String = ""
    private var currentMarkets: [CurrentMarkets] = []
    @Published var matchMarket: [MatchMarketName] = []
    
    init() {
        dispatchGroup.enter()
        bitCoinAllMarketName { allCoinName in
            self.coinMarket = allCoinName
            self.bitCoinNameMatchedPrice(allCoinNames: allCoinName) { currentMarket in
                self.currentMarkets = currentMarket
                self.dispatchGroup.leave()
            }
            
        }
        dispatchGroup.notify(queue: .main) {
//            print("결과 : \(self.currentMarkets)")
            self.matchMarket = (0..<self.coinMarket.count).map {
                MatchMarketName(marketName: self.coinMarket[$0].koreanName, marketInfo: self.currentMarkets[$0])
            }
        }
    }
    
    func bitCoinAllMarketName(completionHandler: @escaping(([CoinMarket]) -> Void)) {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let session = URLSession.shared
        //enter()
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
                completionHandler(decodedData)
            } catch {
                print("디코딩 에러 \(error.localizedDescription)")
            }
            
        }
        .resume()
    }
    
    func bitCoinNameMatchedPrice(allCoinNames: [CoinMarket], completionHandler: @escaping(([CurrentMarkets])-> Void)) {
        let filterCoinNames = allCoinNames.map { $0.market }.joined(separator: ", ")
        let url = URL(string: "https://api.upbit.com/v1/ticker?markets=\(filterCoinNames)")!
        let session = URLSession.shared
        //enter
        session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            if let statusCode = response as? HTTPURLResponse {
                print("업비트 상태코드 : \(statusCode.statusCode)")
            }
            
            guard let data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([CurrentMarkets].self, from: data)
                   completionHandler(decodedData)
            } catch {
                print("디코딩 에러 \(error.localizedDescription)")
            }
            
        }
        .resume()
    }

}

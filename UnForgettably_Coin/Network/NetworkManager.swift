//
//  \.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import Foundation

//class NetworkManager {
//    
//    static let shared = NetworkManager()
//    
//    private init() { }
//    
//    func naverNewsFetch(completionHandler: @escaping (Result<NaverNews, Error>) -> Void) {
//        var urlComponets = URLComponents(string: "https://openapi.naver.com/v1/search/news.json?")
//        let headers = ["X-Naver-Client-Id" : ServiceKey.naverClientID, "X-Naver-Client-Secret": ServiceKey.naverSecretKey]
//        let searchQuery = URLQueryItem(name: "query", value: "coin")
//        let dateQuery = URLQueryItem(name: "date", value: "10")
//        
//        urlComponets?.queryItems?.append(searchQuery)
//        urlComponets?.queryItems?.append(dateQuery)
//        
//        var request = URLRequest(url: (urlComponets?.url)!)
//        request.httpMethod = "GET"
//        
//        for (key, value) in headers {
//            request.setValue(value, forHTTPHeaderField: key)
//        }
//        
//        
//        let session = URLSession.shared
//        session.dataTask(with: request) { data, response, error in
//            if let error {
//                print(error.localizedDescription)
//            }
//            
//            if let statusCode = response as? HTTPURLResponse {
//                print("상태코드 : \(statusCode.statusCode)")
//            }
//            
//            guard let data else { return }
//            
//            do {
//                let decodedData = try JSONDecoder().decode(NaverNews.self, from: data)
//                completionHandler(.success(decodedData))
//            } catch {
//                print("디코딩 에러 \(error.localizedDescription)")
//            }
//            
//        }
//        .resume()
//        
//    }
//}

//
//  WebSocketManager.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/7/24.
//

import Foundation
import Combine

final class WebSocketManager: NSObject {
    static let shared = WebSocketManager()
    
    private override init() {
        super.init()
    }
    
    private var timer: Timer?
    
    private var webSocket: URLSessionWebSocketTask?
    
    private var isConnect = false
    
    var currentCoinValues = PassthroughSubject<CurrentCoinValue, Never>()
    
    func openWebSocket() {
        
        if let url = URL(string: "wss://api.upbit.com/websocket/v1") {
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            webSocket = session.webSocketTask(with: url)
            webSocket?.resume()
            ping()
        }
        
    }
    
    func closeWebSocket() {
        webSocket?.cancel(with: .goingAway, reason: nil)
        webSocket = nil
        timer?.invalidate()
        timer = nil
        
        isConnect = false
    }
    
    func send(_ selectedCoind: String) {
        let sendString = """
        [{"ticket":"test"},{"type":"ticker","codes":["\(selectedCoind)"]}]
"""
        webSocket?.send(.string(sendString), completionHandler: { error in
            if let error {
                print("실시간 정보 요청 실패 : \(error.localizedDescription)")
            }
        })
    }
    
    func receive() {
        if isConnect {
            webSocket?.receive(completionHandler: { [weak self] result in
                switch result {
                case .success(let success):
                    switch success {
                    case .data(let data):
                        do {
                            let decodedData = try JSONDecoder().decode(CurrentCoinValue.self, from: data)
                            self?.currentCoinValues.send(decodedData)
                        } catch {
                            print("receive Error: \(error.localizedDescription)")
                        }
                    case .string(let string): print(string)
                    @unknown default : print("")
                    }
                case .failure(let failure):
                    print(failure)
                    self?.closeWebSocket()
                }
                self?.receive()
            })
        }
       
    }
    
    func ping() {
        webSocket?.sendPing(pongReceiveHandler: { error in
            if let error {
                print("Ping 실패")
            } else {
                print("Ping 성공")
            }
        })
    }
    
}

extension WebSocketManager : URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("WebSocket 연결 성공")
        isConnect = true
        receive()
        
    }
    
    private func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("WebSocket 연결 끊김")
        isConnect = false
    }
    
}

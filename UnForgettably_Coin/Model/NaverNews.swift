//
//  NaverNews.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/6/24.
//

import Foundation

struct NaverNews: Decodable, Hashable {
    let lastBuildDate: String
    let total: Int
    var start: Int
    var display: Int
    var items: [Items]
}

struct Items: Decodable, Hashable {
    let title: String
    let originallink: String
    let link: String
    let description: String
    let pubDate: String
}

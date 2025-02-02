//
//  TopArticlesResponse.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import Foundation

struct TopArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let description: String?
    let urlToImage: String?
}

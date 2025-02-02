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
    let id: UUID
    let title: String
    let description: String?
    let urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title, description, urlToImage
    }
    
    init(title: String, description: String?, urlToImage: String?) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
    }
}

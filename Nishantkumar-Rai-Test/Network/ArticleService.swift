//
//  ArticleServices.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import Foundation
import Combine

protocol ArticleServiceProtocol {
    func fetchTopArticles() -> AnyPublisher<[Article], Error>
}

class ArticleService: ArticleServiceProtocol {
    private let apiManager: APIManager
    private let apiService: APIService
    
    init(apiManager: APIManager = APIManager.shared, apiService: APIService = APIService()) {
        self.apiManager = apiManager
        self.apiService = apiService
    }
    
    func fetchTopArticles() -> AnyPublisher<[Article], Error> {
        guard let url = apiManager.makeURL() else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return apiService.fetchData(from: url)
            .map { (response: TopArticlesResponse) in
                response.articles
            }
            .eraseToAnyPublisher()
    }
    
}

//
//  ArticleViewModel.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import Foundation
import Combine

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var erroressage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    private let articleService: ArticleServiceProtocol
    @Published var isLoading: Bool = false
    
    init(articleService: ArticleServiceProtocol = ArticleService()) {
        self.articleService = articleService
        fetchNews()
    }
    
    func fetchNews() {
        self.isLoading = true
        articleService.fetchTopArticles()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    DispatchQueue.main.async {
                        self?.isLoading = false
                        self?.erroressage = error.localizedDescription
                    }
                }
            }, receiveValue: { [weak self] articles in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.articles = articles
                }
            })
            .store(in: &cancellables)
    }
}

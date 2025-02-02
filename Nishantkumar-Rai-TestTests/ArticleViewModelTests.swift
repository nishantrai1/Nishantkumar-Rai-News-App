//
//  ArticleViewModelTests.swift
//  Nishantkumar-Rai-TestTests
//
//  Created by Nishant Rai on 02/02/25.
//

import XCTest
@testable import Nishantkumar_Rai_Test
import Combine

final class ArticleViewModelTests: XCTestCase {
    var viewModel: ArticleViewModel!
    var mockService: MockArticleService!
    var cancellable: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        mockService = MockArticleService()
        viewModel = ArticleViewModel(articleService: mockService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockService = nil
        cancellable.removeAll()
    }
    
    func testFetchNewsSuccess() {
        mockService.shouldReturnSuccess = true
        let expectation = XCTestExpectation(description: "Top Headlines should be loaded successfully")
        
        viewModel.$articles
            .sink { articles in
                if !articles.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellable)
        
        viewModel.fetchNews()
        wait(for: [expectation], timeout: 2.0)
        XCTAssertFalse(viewModel.articles.isEmpty)
    }
    
    func testFetchNewsFailure() {
        mockService.shouldReturnSuccess = false
        let expectation = XCTestExpectation(description: "Error message value should not be nil")
        
        viewModel.$erroressage
            .sink { error in
                if let error = error {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellable)
        
        viewModel.fetchNews()
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNotNil(viewModel.erroressage)
    }
}

class MockArticleService: ArticleServiceProtocol {
    var shouldReturnSuccess = false
    
    let articleTestData = [
        Article(title: "Test Title 1", description: "Test Description 1", urlToImage: nil),
        Article(title: "Test Title 3", description: "Test Description 3", urlToImage: nil),
    ]
    
    func fetchTopArticles() -> AnyPublisher<[Nishantkumar_Rai_Test.Article], Error> {
        if shouldReturnSuccess {
            return Just(articleTestData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
    }
}

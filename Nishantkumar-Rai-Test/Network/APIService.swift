//
//  APIService.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func fetchData<T: Decodable>(from url: URL) -> AnyPublisher<T, Error>
}

class APIService: APIServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.session = session
    }
    
    func fetchData<T>(from url: URL) -> AnyPublisher<T, Error> where T : Decodable {
        return session.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

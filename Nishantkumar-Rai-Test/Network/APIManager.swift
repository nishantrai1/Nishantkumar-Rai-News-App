//
//  APIManager.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private var apiKey: String {
        guard let path = Bundle.main.path(forResource: "APIsInfo", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["APIKey"] as? String else {
            return ""
        }
        return key
    }
    private let baseURL = "https://newsapi.org/v2/top-headlines"
    
    private init() {}
    
    func makeURL(with country: String = "us") -> URL? {
        return URL(string: "\(baseURL)?country=\(country)&apiKey=\(apiKey)")
    }
}

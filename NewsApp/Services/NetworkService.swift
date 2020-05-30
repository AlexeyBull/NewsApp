//
//  NetworkService.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import Foundation

enum ServerError: Error {
    case noDataProvided
    case failedToDecode
}

class NetworkService {
    
    func loadArticles(onComplete: @escaping ([Articles]) -> Void, onError: @escaping (Error) -> Void) {
        
        let urlString = NetworkConstants.baseUrl + NetworkConstants.apikey
        
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onError(ServerError.noDataProvided)
                }
                return
            }
                guard let articles = try? JSONDecoder().decode(TechNews.self, from: data) else {
                    DispatchQueue.main.async {
                        onError(ServerError.failedToDecode)
                    }
                    return
                }
                DispatchQueue.main.async {
                    onComplete(articles.articles)
                }
            }
            task.resume()
    }
}

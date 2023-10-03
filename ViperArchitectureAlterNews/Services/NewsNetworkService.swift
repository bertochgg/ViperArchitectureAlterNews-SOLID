//
//  NewsNetworkService.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 02/10/23.
//

import Foundation

protocol NewsNetworkServiceProtocol: AnyObject {
    func getNews(completion: @escaping (Result<NewsEntity, NetworkErrors>) -> Void) async
}

final class NewsNetworkService: NewsNetworkServiceProtocol {
    func getNews(completion: @escaping (Result<NewsEntity, NetworkErrors>) -> Void) async {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=\(Constants.apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let newsData = try jsonDecoder.decode(NewsEntity.self, from: data)
                completion(.success(newsData))
            } catch {
                if let urlError = error as? URLError {
                    completion(.failure(.networkError(urlError)))
                } else {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

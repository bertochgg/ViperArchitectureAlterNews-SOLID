//
//  NewsEntity.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

struct NewsEntity: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]

}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let content: String
}

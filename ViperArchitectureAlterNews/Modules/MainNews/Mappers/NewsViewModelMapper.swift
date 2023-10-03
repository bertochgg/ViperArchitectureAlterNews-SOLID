//
//  NewsViewModelMapper.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 02/10/23.
//

import Foundation

protocol NewsViewModelMapperProtocol: AnyObject {
    func map(entity: Article) -> NewsViewModel
}
final class NewsViewModelMapper: NewsViewModelMapperProtocol {
    func map(entity: Article) -> NewsViewModel {
        .init(imageURL: URL(string: entity.urlToImage ?? ""),
              title: entity.title,
              description: entity.description,
              content: entity.content)
    }
}

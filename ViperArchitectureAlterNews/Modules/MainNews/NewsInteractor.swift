//
//  NewsInteractor.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

final class NewsInteractor: PresenterToInteractorNewsProtocol {
    weak var presenter: InteractorToPresenterNewsProtocol?
    private let newsService: NewsNetworkServiceProtocol
    
    init(newsService: NewsNetworkServiceProtocol) {
        self.newsService = newsService
    }
    
    func getNews() {
        Task {
            await newsService.getNews { [weak self] result in
                switch result {
                case .success(let newsEntity):
                    self?.presenter?.fetchDataSuccess(news: newsEntity)
                case .failure(let error):
                    self?.presenter?.fetchDataFailure(error: .decodingError(error))
                }
            }
        }
    }
}

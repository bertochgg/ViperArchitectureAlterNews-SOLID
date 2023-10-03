//
//  NewsPresenter.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

final class NewsPresenter: ViewToPresenterNewsProtocol {
    weak var view: PresenterToViewNewsProtocol?
    private let interactor: PresenterToInteractorNewsProtocol
    private let router: PresenterToRouterNewsProtocol
    private let mapper: NewsViewModelMapper
    
    private var newsModels: [Article] = []
    private var newsViewModels: [NewsViewModel] = []
    
    init(interactor: PresenterToInteractorNewsProtocol,
         router: PresenterToRouterNewsProtocol,
         mapper: NewsViewModelMapper) {
        self.interactor = interactor
        self.router = router
        self.mapper = mapper
    }
    
    func fetchNews() {
        interactor.getNews()
    }
}

extension NewsPresenter: InteractorToPresenterNewsProtocol {
    func fetchDataSuccess(news: NewsEntity) {
        newsModels = news.articles
        newsViewModels = newsModels.map(mapper.map(entity:))
        view?.displayNews(news: newsViewModels)
    }
    
    func fetchDataFailure(error: NetworkErrors) {
        view?.displayError(error: error)
    }
    
    
}

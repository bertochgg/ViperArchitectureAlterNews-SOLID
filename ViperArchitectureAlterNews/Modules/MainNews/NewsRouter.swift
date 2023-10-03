//
//  NewsRouter.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

final class NewsRouter: PresenterToRouterNewsProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // init references
        let interactor: PresenterToInteractorNewsProtocol = NewsInteractor(newsService: NewsNetworkService())
        let router: PresenterToRouterNewsProtocol = NewsRouter()
        let presenter: ViewToPresenterNewsProtocol & InteractorToPresenterNewsProtocol = NewsPresenter(interactor: interactor,
                                                                   router: router,
                                                                   mapper: NewsViewModelMapper())
        let view = NewsViewController(presenter: presenter, dataSource: NewsDataSource())
        
        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
}

//
//  NewsProtocols.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterNewsProtocol: AnyObject {
    var view: PresenterToViewNewsProtocol? { get set }
    
    func fetchNews()
}

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewNewsProtocol: AnyObject {
    func displayNews(news: [NewsViewModel])
    func displayError(error: NetworkErrors)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsProtocol: AnyObject {
    var presenter: InteractorToPresenterNewsProtocol? { get set }
    
    func getNews()
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsProtocol: AnyObject {
    func fetchDataSuccess(news: NewsEntity)
    func fetchDataFailure(error: NetworkErrors)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterNewsProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
}

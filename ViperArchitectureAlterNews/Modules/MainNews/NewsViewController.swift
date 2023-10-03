//
//  NewsViewController.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

final class NewsViewController: UIViewController {
    private let presenter: ViewToPresenterNewsProtocol
    private let dataSource: NewsDataSourceProtocol
    
    lazy private var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 380
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return tableView
    }()
    
    init(presenter: ViewToPresenterNewsProtocol,
         dataSource: NewsDataSourceProtocol) {
        self.presenter = presenter
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchNews()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(newsTableView)
        
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        newsTableView.dataSource = dataSource

    }

}

extension NewsViewController: PresenterToViewNewsProtocol {
    func displayNews(news: [NewsViewModel]) {
        DispatchQueue.main.async {
            self.dataSource.updateData(newsViewModels: news)
            self.newsTableView.reloadData()
        }
    }
    
    func displayError(error: NetworkErrors) {
        print(error.localizedDescription)
    }

}

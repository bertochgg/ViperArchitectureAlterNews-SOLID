//
//  NewsDataSource.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 02/10/23.
//

import UIKit

protocol NewsDataSourceProtocol: AnyObject, UITableViewDataSource {
    func updateData(newsViewModels: [NewsViewModel])
}

final class NewsDataSource: NSObject, NewsDataSourceProtocol {
    private var newsViewModels: [NewsViewModel] = []
    
    func updateData(newsViewModels: [NewsViewModel]) {
        self.newsViewModels = newsViewModels
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(newsViewModel: newsViewModels[indexPath.row])
        
        return cell
    }
    
    
}

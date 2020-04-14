//
//  ArticleList.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 15/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

extension ArticlesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = articles[indexPath.row].title
        cell.detailTextLabel?.text = articles[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewController = WebViewViewController()
        webViewController.url = articles[indexPath.row].url
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let offsetY = scrollView.contentOffset.y
      let contentHeight = scrollView.contentSize.height
      if offsetY > (contentHeight - scrollView.frame.height) {
        if !isFetching {
          refetchArticles()
        }
      }
    }
    
}

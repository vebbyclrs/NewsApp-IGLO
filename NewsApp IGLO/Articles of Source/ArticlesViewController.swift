//
//  ArticlesViewController.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    var articles : [Article] = []
    var source : Source?
    var page = 1
    var isFetching : Bool = false
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        refetchArticles()
    }
    
    func initView() {
        self.navigationItem.title = String(source?.name ?? "Articles")
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func refetchArticles() {
        guard let sourceId = source?.id
            else {
            return
        }
        if !isFetching {
            isFetching = true
            API.fetchEverything(sourceID: sourceId, page: page, { (json) in
                guard let json = json else {
                    return
                }
                var news : [Article] = []
                for article in json["articles"].arrayValue {
                    news.append(Article(json: article))
                }
                self.articles += news
                self.tableView.reloadData()
                self.page += 1
                self.isFetching = false
            })
        }
        
    }
}

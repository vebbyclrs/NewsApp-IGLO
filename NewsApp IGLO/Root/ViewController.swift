//
//  ViewController.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sources : [Source]?
    var isFetching : Bool = false

    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var categoryView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 30)
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TabCategoriesCollectionCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News Sources"
        initView()
        loadSourceData(category: nil)
    }
    
    func initView() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(categoryView)
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            categoryView.heightAnchor.constraint(equalToConstant: 35),
            categoryView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        ])
    }
    
    func loadSourceData(category : String?) {
        isFetching = true
        API.fetchNewsSources(newsCategory: category) { (sourceList) in
            guard let sources = sourceList else {return}
            self.sources = sources
            self.tableView.reloadData()
            self.isFetching = false
        }
    }

}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constant.newsCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //FIXME: bikin UICollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! TabCategoriesCollectionCell
        cell.categoryLabel.text = Constant.newsCategories[indexPath.row].capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! TabCategoriesCollectionCell
        
        if !isFetching {
            if indexPath.row == 0 {
                loadSourceData(category: nil)
            } else {
                loadSourceData(category: Constant.newsCategories[indexPath.row])
            }
        } else {
            collectionView.deselectItem(at: indexPath, animated: false)
        }
            
        print (indexPath)
    }
}


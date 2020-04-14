//
//  ViewController.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    lazy var categoryView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 30)
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        initView()
    }
    
    func initView() {
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
            tableView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        ])
    }

}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //FIXME: bikin UICollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! TabCollectionViewCell
        cell.categoryLabel.text = newsCategories[indexPath.row].capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! TabCollectionViewCell
        cell.contentView.backgroundColor = .gray
        print (indexPath)
    }
}


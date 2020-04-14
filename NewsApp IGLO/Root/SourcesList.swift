//
//  SourcesList.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isSearching {
            return sources?.count ?? 0
        } else {
            return filteredSources?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        if !isSearching {
            cell.textLabel?.text = sources?[indexPath.row].name
            cell.detailTextLabel?.text = sources?[indexPath.row].url?.absoluteString
        } else {
            cell.textLabel?.text = filteredSources?[indexPath.row].name
            cell.detailTextLabel?.text = filteredSources?[indexPath.row].url?.absoluteString
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextView = ArticlesViewController()
        if !isSearching {
            nextView.source = self.sources?[indexPath.row]
        } else {
            nextView.source = self.filteredSources?[indexPath.row]
        }
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}

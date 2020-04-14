//
//  ArticlesModel.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 15/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftyJSON

struct Article {
    struct Source {
        let id : String?
        let name : String?
        
        init(json: JSON) {
            id = json["id"].string
            name = json["name"].string
        }
    }
    let source : Article.Source
    let author : String?
    let title : String?
    var description : String?
    var url : URL?
    
    init(json : JSON) {
        source = Article.Source(json: json["source"])
        author = json["author"].string
        title = json["title"].string
        description = json["description"].string
        url = URL(string: json["url"].string!)
    }
}

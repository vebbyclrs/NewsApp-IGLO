//
//  SourceModel.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftyJSON

struct Source: Codable {
    var id : String?
    var name : String?
    var description : String?
    var url : URL?
    var category : String?
    var language : String?
    var country : String?
    
    init(JSON: JSON ) {
        id = JSON["id"].string
        name = JSON["name"].string
        description = JSON["description"].string
        category = JSON["category"].string
        language = JSON["language"].string
        country = JSON["country"].string
        
        let urlString = JSON["url"].string
        if let urlString = urlString {
            url = URL(string: urlString)
        }
    }
}

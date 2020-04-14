//
//  API.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Alamofire
import SwiftyJSON

class API {
    static func fetchNewsSources(newsCategory : String?,_ completionHandler : @escaping (([Source]?) -> Void)) {
        let url: String
        var sources : [Source]?
        
        if newsCategory != nil && newsCategory != "" {
            url = "\(Constant.api)/v2/sources?category=\(newsCategory!)&\(Constant.apiKey)"
        } else {
            url = "\(Constant.api)/v2/sources?\(Constant.apiKey)"
        }
        
        request(url)
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let json = JSON(response.result.value!)
                    //convert json
                    sources = []
                    for responseJson in json["sources"].arrayValue {
                        sources?.append(Source(JSON: responseJson))
                    }
                    completionHandler(sources)
                } else {
                    print("Failed while fetching news sources")
                    completionHandler(nil)
                }
        }
    }
    
    static func fetchEverything(sourceID : String, page: Int, _ completionHandler : @escaping ((JSON?) -> Void)) {
        let url : String =  "\(Constant.api)/v2/everything?sources=\(sourceID)&page=\(page)&\(Constant.apiKey)"
        
        request(url)
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let json = JSON(response.result.value!)
                    completionHandler(json)
                } else {
                    print("Failed while fetch everything from source \(sourceID)")
                    completionHandler(nil)
                }
        }
    }
}

//
//  NewsConstants.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 22/10/23.
//

import Foundation

let baseURL: String = "https://api.spaceflightnewsapi.net"


enum NewsCategoryURL: Int {
    case articles = 0
    case blogs
    case info
    case reports
    
    func getCategoryListURL() -> String {
        switch self {
        case .articles:
            return baseURL + "/v4/articles/"
        case .blogs:
            return baseURL + "/v4/blogs/"
        case .info:
            return baseURL + "/v4/info/"
        case .reports:
            return baseURL + "/v4/reports/"
        }
    }
    
    func getCategoryDetailsURL(newsID: Int) -> String {
        switch self {
        case .articles:
            return baseURL + "/v4/articles/" + String(describing: newsID)
        case .blogs:
            return baseURL + "/v4/blogs/" + String(describing: newsID)
        case .info:
            return baseURL + "/v4/info/" + String(describing: newsID)
        case .reports:
            return baseURL + "/v4/reports/" + String(describing: newsID)
        }
    }
}

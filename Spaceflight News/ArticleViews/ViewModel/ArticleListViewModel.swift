//
//  ArticleListViewModel.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    @Published var articles: [Results] = []
    var resultValue: Article_Base?
    var fetchURL: String?
    init(categoryID: Int) {
        self.fetchURL = NewsCategoryURL(rawValue: categoryID)?.getCategoryListURL()
    }
    
    func fetchArticles() {
        guard let fetchURL = self.fetchURL else {
            return
        }
        FetchArticleService.shared.fetchArticles(url: fetchURL, completion: { [weak self] articles in
                DispatchQueue.main.async {
                    guard let response = articles, let result = response.results else {return}
                    self?.resultValue = response
                    self?.articles = result
                }
        })
    }
    
    func fetchNextResults() {
        guard let fetchURL = resultValue?.next else {
            return
        }
        FetchArticleService.shared.fetchArticles(url: fetchURL, completion: { [weak self] articles in
                DispatchQueue.main.async {
                    guard let response = articles, let result = response.results else {return}
                    self?.resultValue = response
                    self?.articles.append(contentsOf: result)
                }
        })
    }
}

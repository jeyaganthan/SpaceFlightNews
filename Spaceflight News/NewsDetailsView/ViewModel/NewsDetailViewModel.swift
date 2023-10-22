//
//  NewsDetailViewModel.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 22/10/23.
//

import Foundation

class NewsDetailViewModel: ObservableObject {
    @Published var articleURL: URL?

    func fetchArticle(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let fetchedArticle = try JSONDecoder().decode(NewsDetails_Base.self, from: data)
                    DispatchQueue.main.async {
                        self.articleURL = URL(string: fetchedArticle.url.valueOrEmpty)
                    }
                } catch {
                    print("Error decoding: \(error)")
                }
            }
        }.resume()
    }
}

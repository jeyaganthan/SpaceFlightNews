//
//  FetchArticleService.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation


class FetchArticleService {
    static let shared = FetchArticleService()
    private init() {}

    func fetchArticles(url: String, completion: @escaping (Article_Base?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let response = try? JSONDecoder().decode(Article_Base.self, from: data) else {
                completion(nil)
                return
            }
            completion(response)
        }.resume()
    }
}

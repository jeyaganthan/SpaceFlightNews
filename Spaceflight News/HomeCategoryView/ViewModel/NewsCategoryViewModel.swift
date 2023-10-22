//
//  NewsCategoryViewModel.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation

class NewsCategoryViewModel: ObservableObject {
    @Published var categories: [NewsCategory] = [
        NewsCategory(id: 1, title: "Articles", image: "articles"),
        NewsCategory(id: 2, title: "Blogs", image: "blogs"),
        NewsCategory(id: 3, title: "Reports", image: "report")
    ]
}

//
//  NewsArticleListView.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import SwiftUI

struct NewsArticleListView: View {
    @ObservedObject var viewModel = ArticleListViewModel(categoryID: 0)
    var categoryID: Int?
    var body: some View {
            List(0..<viewModel.articles.count, id: \.self) { index in
                NavigationLink(destination: destinationView(for: index)) {
                    VStack(alignment: .leading) {
                        if let articleURL = viewModel.articles[index].image_url, let imageUrl = URL(string: articleURL)  {
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(height: 150)
                            .frame(alignment: .center)
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                        }
                        
                        Text(viewModel.articles[index].title.valueOrEmpty)
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Text(viewModel.articles[index].news_site.valueOrEmpty)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        
                        Text(viewModel.articles[index].summary.valueOrEmpty)
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                        
                        Text(viewModel.articles[index].updated_at.valueOrEmpty)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                    .padding()
                }.onAppear(){
                    if viewModel.articles.count - 1 == index {
                        self.viewModel.fetchNextResults()
                    }
                }
            }.refreshable {
                viewModel.fetchArticles()
            }
            .onAppear(perform: viewModel.fetchArticles)
    }
    
    func destinationView(for index: Int) -> some View {
        return AnyView(NewsDetailView(url:NewsCategoryURL(rawValue: self.categoryID ?? 0)?.getCategoryDetailsURL(newsID: self.viewModel.articles[index].id ?? 0)).navigationBarTitleDisplayMode(.inline))
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleListView()
    }
}



extension Optional where Wrapped == String {
    var valueOrEmpty: String {
        guard let unwrapped = self else {
            return ""
        }
        return unwrapped
    }
}

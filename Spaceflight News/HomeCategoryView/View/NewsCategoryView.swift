//
//  NewsCategoryView.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//
import SwiftUI

struct NewsCategoryView: View {
    @ObservedObject var viewModel = NewsCategoryViewModel()
    
    var body: some View {
        NavigationView {
            List(0..<viewModel.categories.count, id: \.self) { index in
                NavigationLink(destination: destinationView(for: index)) {
                    HStack {
                        Image(viewModel.categories[index].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text(viewModel.categories[index].title)
                            .font(.headline)
                    }
                    .padding()
                }
            }
            .navigationTitle("News Categories")
        }
    }
    
    func destinationView(for index: Int) -> some View {
        return AnyView(NewsArticleListView(viewModel: ArticleListViewModel(categoryID: index)).navigationTitle("Spaceflight News").navigationBarTitleDisplayMode(.inline))
    }
}

struct NewsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoryView()
    }
}

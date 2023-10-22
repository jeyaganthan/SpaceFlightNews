//
//  NewsDetailView.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 22/10/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct NewsDetailView: View {
    @ObservedObject var viewModel = NewsDetailViewModel()
    var url:String? = NewsCategoryURL(rawValue: 0)?.getCategoryDetailsURL(newsID: 0)

    var body: some View {
        NavigationView {
            Group {
                if let articleURL = viewModel.articleURL {
                    WebView(url: articleURL)
                } else {
                    Text("Loading...")
                }
            }
            .onAppear {
                guard let newsURL = self.url else {
                    return
                }
                viewModel.fetchArticle(urlString: newsURL)
            }
        }
    }
}


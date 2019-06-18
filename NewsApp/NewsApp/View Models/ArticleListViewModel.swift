//
//  ArticleListViewModel.swift
//  NewsApp
//
//  Created by Miguel Herrero on 16/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ArticleViewModel: Identifiable {
    let id = UUID()
    let article: Article

    init(article: Article) {
        self.article = article
    }

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description ?? ""
    }
}

class ArticleListViewModel: BindableObject {

    let didChange = PassthroughSubject<ArticleListViewModel, Never>()

    var articles = [ArticleViewModel]() {
        didSet {
            didChange.send(self)
        }
    }

    init() {
        fetchTopHeadlines()
    }

    private func fetchTopHeadlines() {
        guard
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d9430c3c50014c938097e6fe198fcff2")
            else { fatalError("URL is not correct!") }

        Webservice().loadToHeadlines(url: url) { articles in
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
}

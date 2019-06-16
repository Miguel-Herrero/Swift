//
//  ContentView.swift
//  NewsApp
//
//  Created by Miguel Herrero on 16/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import SwiftUI

struct ContentView : View {

    @ObjectBinding var model = ArticleListViewModel()

    var body: some View {
        List(model.articles) { article in
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(nil)

                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

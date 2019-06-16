//
//  SearchView.swift
//  Repohub
//
//  Created by Miguel Herrero on 16/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import SwiftUI

struct SearchView : View {
    @State private var query: String = "Swift"
    @EnvironmentObject var repoStore: ReposStore

    var body: some View {
        NavigationView {
            List {
                TextField($query, placeholder: Text("Type something…"))
                ForEach(repoStore.repos) { repo in
                    RepoRow(repo: repo)
                }
            }.navigationBarTitle(Text("Search"))
        }.onAppear(perform: fetch)
    }

    private func fetch() {
        repoStore.fetch(matching: query)
    }
}

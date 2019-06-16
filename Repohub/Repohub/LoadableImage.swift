//
//  LoadableImage.swift
//  Repohub
//
//  Created by Miguel Herrero on 16/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import SwiftUI

struct LoadableImage : View {
    let url: URL
    @State private var uiImage: UIImage? = nil

    var body: some View {
        Text("Holi")
//        if let image = uiImage {
//            return Image(uiImage: image).resizable()
//        } else {
//            return Image(systemName: "photo")
//        }
    }

    private func fetch() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.uiImage = image
                }
            }
        }.resume()
    }
}

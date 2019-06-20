//
//  Landmark.swift
//  Landmarks
//
//  Created by Miguel Herrero on 19/06/2019.
//  Copyright © 2019 Miguel Herrero Baena. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    var featureImage: Image? {
        guard isFeatured else { return nil }

        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(verbatim: name))
    }

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

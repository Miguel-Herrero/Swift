//
//  User.swift
//  TDD
//
//  Created by Miguel Herrero on 13/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import Foundation

struct User {
    // Changed from [String] to Set<String> for better performance
    var products = Set<String>()

    mutating func buy(_ product: String) {
        products.insert(product)
    }

    func owns(_ product: String) -> Bool {
        return products.contains(product)
    }
    
}

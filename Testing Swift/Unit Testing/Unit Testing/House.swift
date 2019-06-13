//
//  House.swift
//  Unit Testing
//
//  Created by Miguel Herrero on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import Foundation

struct House {
    var bedrooms: Int
    var bathrooms: Int
    var cost: Int

    init(bedrooms: Int, bathrooms: Int) {
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.cost = bedrooms * bathrooms * 50_000
    }

    func checkSuitability(desiredBedrooms: Int, desiredBathrooms: Int) -> Bool {
        if bedrooms >= desiredBedrooms && bathrooms >= desiredBathrooms {
            return true
        } else {
            return false
        }
    }
}

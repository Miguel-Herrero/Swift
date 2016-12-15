//
//  Location.swift
//  Rainy Shiny Cloudy
//
//  Created by Miguel Herrero on 15/12/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    var latitude: Double!
    var longitude: Double!

    private init() {}
}

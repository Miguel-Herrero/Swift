//
//  Converter.swift
//  Unit Testing
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}

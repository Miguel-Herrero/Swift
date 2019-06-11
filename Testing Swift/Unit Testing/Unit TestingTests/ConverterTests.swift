//
//  ConverterTests.swift
//  Unit TestingTests
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import Unit_Testing

class ConverterTests: XCTestCase {

    var sut: Converter!

    override func setUp() {
        sut = Converter()
    }

    override func tearDown() {
        sut = nil
    }

    func test32FahrenheitIsZeroCelsius() {
        // Given
        let input = 32.0

        // When
        let celsius = sut.convertToCelsius(fahrenheit: input)

        // Then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }

    func test212FahrenheitIs100Celsius() {
        // Given
        let input = 212.0

        // When
        let celsius = sut.convertToCelsius(fahrenheit: input)

        // Then
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }

}

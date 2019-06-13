//
//  CoverageTests.swift
//  CoverageTests
//
//  Created by Miguel Herrero on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import Unit_Testing

class CoverageTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test4Bed2BathHouse_Fits3Bed2Bath_Requirements() {
        // Given
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2

        // When
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms, desiredBathrooms: desiredBathrooms)

        // Then
        XCTAssertTrue(suitability)
    }

}

//
//  TDDTests.swift
//  TDDTests
//
//  Created by Miguel Herrero on 13/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {

    func testReadingBookAddsToLibrary() {
        // Given
        let bookToBuy = "Great Expectations"
        var user = User()
        let randomTitle = UUID().uuidString
        for index in 1...1_000_000 {
            user.buy("\(randomTitle)\(index)")
        }

        // When
        user.buy(bookToBuy)

        measure {
            // Then
            XCTAssertTrue(user.owns(bookToBuy))
        }
    }

}

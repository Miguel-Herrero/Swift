//
//  TDD_ProjectTests.swift
//  TDD_ProjectTests
//
//  Created by Miguel Herrero on 13/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import TDD_Project

class TDD_ProjectTests: XCTestCase {
    func testLoadingImages() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }
}

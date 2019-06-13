//
//  DetailTests.swift
//  TDD_ProjectTests
//
//  Created by Miguel Herrero on 14/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import TDD_Project

class DetailTests: XCTestCase {

    func testDetailImageViewExists() {
        // Given
        let sut = DetailViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertNotNil(sut.imageView)
    }

    func testDetailViewIsImageView() {
        // Given
        let sut = DetailViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.view, sut.imageView)
    }

    func testDetailImageHasWhiteBackground() {
        // Given
        let sut = DetailViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.imageView.backgroundColor, .white)
    }

    func testDetailImageScalesAspectFit() {
        // Given
        let sut = DetailViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.imageView.contentMode, .scaleAspectFit)
    }
}

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

    func testTableExists() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertNotNil(sut.tableView)
    }

    func testTableViewHasCorrectRowCount() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count)
    }

    func testEachCellHasTheCorrectText() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)

            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
}

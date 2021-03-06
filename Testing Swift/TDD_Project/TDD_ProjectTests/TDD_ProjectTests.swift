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

    func testCellsHaveDisclosureIndicators() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)

            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }

    func testViewControllerUsesLargeTitles() {
        // Given
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }

    func testNavigationBarHasTitle() {
        // Given
        let sut = ViewController()

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.title, "TDD Project")
    }

    func testSelectingImageShowsDetail() {
        // Given
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)

        // When
        sut.pictureSelectAction = {
            selectedImage = $0
        }

        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)

        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }

    func testSelectingImageShowsDetailImage() {
        // Given
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)

        // When
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()

            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }

        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }
}

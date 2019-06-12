//
//  SimpleViewControllerTests.swift
//  Unit TestingTests
//
//  Created by Miguel Herrero on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import Unit_Testing

class SimpleViewControllerTests: XCTestCase {

    func testSimpleVC_WhenIsLoaded_ShouldMakeSomethingVisible() {
        // Given
        let sut = SimpleViewController()
        // Make sure the view is created
        sut.loadViewIfNeeded()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(sut.isSomethingVisible)
    }

    func testSimpleVC_WhenIsLoaded_ButtonOutletExists() {
        // Given
        // (Remember to add Storyboard to Unit_TestingTests target)
        let storyboard = UIStoryboard(name: "SimpleStoryboard", bundle: Bundle.main)
        let sut = storyboard.instantiateViewController(identifier: "SimpleViewController") as! SimpleViewController
        // Make sure the view is created
        sut.loadViewIfNeeded()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertNotNil(sut.simpleButton)
    }
}

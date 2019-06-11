//
//  LifecycleTests.swift
//  Unit TestingTests
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest

class LifecycleTests: XCTestCase {

    override class func setUp() {
        print("In class setUp.")
    }

    override class func tearDown() {
        print("In class tearDown.")
    }

    override func setUp() {
        print("In setUp.")
    }

    override func tearDown() {
        print("In tearDown.")
    }

    func testExample() {
        print("Starting test.")

        addTeardownBlock {
            print("In first tearDown block.")
        }

        print("In the middle of the test.")

        addTeardownBlock {
            print("In second tearDown block.")
        }

        print("Finishing test.")
    }
}

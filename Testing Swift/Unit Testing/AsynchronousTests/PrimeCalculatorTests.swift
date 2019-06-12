//
//  PrimeCalculatorTests.swift
//  AsynchronousTests
//
//  Created by Miguel Herrero Baena on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest
@testable import Unit_Testing

class PrimeCalculatorTests: XCTestCase {

    func testPrimesUpTo100ShouldBe25() {
        // Given
        let maximCount = 100
        let expectation = XCTestExpectation(description: "Run some asynchronous work")

        // When
        PrimeCalculator.calculate(upTo: maximCount) {
            // Then
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }

    func testPrimesUpTo100ShouldBe25WithProgress() {
        // Given
        let maximumCount = 100

        // When
        let progress = PrimeCalculator.calculateWithProgress(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
        }

        // Then
        let predicate = NSPredicate(
            format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount]
        )

        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }

    func testPrimesUpTo100ShouldBe25WithFullfillmentCount() {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var primeCounter = 0

        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25

        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            XCTAssertEqual(primes[primeCounter], number)

            expectation.fulfill()
            primeCounter += 1
        }

        wait(for: [expectation], timeout: 3)
    }

    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculateSync(upTo: 1_000_000)
        }
    }

}

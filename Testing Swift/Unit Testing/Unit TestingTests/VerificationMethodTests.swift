//
//  VerificationMethodTests
//  Unit TestingTests
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest

class VerificationMethodTests: XCTestCase {

    func testDivision_10By3_shouldGiveQuotientOf3AndRemainderOf1() {
        // Given
        let dividend = 10
        let divisor = 3

        // When
        let result = divisionRemainder(of: dividend, dividedBy: divisor)

        // Then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }

    // MARK: - Verification method
    /**
     Verification method.
     Use `file` and `line` to show the XCT error line on the call that produced the error, not the assertion that failed.
     */
    func verifyDivision(_ result: (quotient: Int, remainder: Int),
                        expectedQuotient: Int,
                        expectedRemainder: Int,
                        file: StaticString = #file,
                        line: UInt = #line) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }

    // MARK: - System Under Test
    /**
     This is the method to test. For simplicity, declare it here instead of in custom app file.
     */
    func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
        let quotient = number / dividedBy
        let remainder = number % dividedBy

        return (quotient, remainder)
    }

}

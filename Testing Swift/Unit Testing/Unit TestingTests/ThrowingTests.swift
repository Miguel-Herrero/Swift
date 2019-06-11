//
//  ThrowingTests.swift
//  Unit TestingTests
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest

// MARK: - System Under Test

enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

// Used for throwing error (GTA example)
extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}

struct Game {
    let name: String

    func play() throws {
        if name == "Mario Kart" {
            throw GameError.notPurchased
        } else if name == "Donkey Kong" {
            throw GameError.notInstalled
        } else if name == "GTA" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}



// MARK: - Test Case

class ThrowingTests: XCTestCase {

    func testPlayingMarioKartThrows() {
        let game = Game(name: "Mario Kart")

        do {
            try game.play()

            // We shouldn't reach here
            XCTFail("Mario Kart has not been purchased.")
        } catch GameError.notPurchased {
            // Test success!
        } catch {
            // We shouldn't reach here
            XCTFail()
        }
    }

    func testPlayingDonkeyKongThrows() {
        let game = Game(name: "Donkey Kong")

        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }

    func testPlayingGTAThrows() {
        let game = Game(name: "GTA")

        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.parentalControlsDisallowed)
        }
    }

    func DISABLED_testPlayingGTAThrows() throws {
        let game = Game(name: "GTA")

        try game.play()
    }

    func testPlayingSonicDoesntThrow() throws {
        let game = Game(name: "Sonic")

        XCTAssertNoThrow(try game.play())
    }

}

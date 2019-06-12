//
//  NotificationTests.swift
//  AsynchronousTests
//
//  Created by Miguel Herrero on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import XCTest

struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")

    /**
     Simulates an upgrading notification after 1 sec
     */
    func upgrade() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)

            let center = NotificationCenter.default
            center.post(name: User.upgradedNotification, object: nil)
        }
    }

    /**
     Send info inside the notification
     */
    func upgradeToGoldLevel() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)

            let center = NotificationCenter.default
            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }

    /**
     To ensure we receive from private NotificationCenter, allow passing a custom center
     */
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)

            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}

class NotificationTests: XCTestCase {

    func testUserUpgradedPostsNotification() {
        // Given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification)

        // When
        user.upgrade()

        // Then
        wait(for: [expectation], timeout: 3)
    }

    func testUserUpgradedToGoldPostsNotification() {
        // Given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification)
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else { return false }

            if level == "gold" {
                return true
            } else {
                return false
            }
        }

        // When
        user.upgradeToGoldLevel()

        // Then
        wait(for: [expectation], timeout: 3)
    }

    func testUserUpgradedPostsNotificationToCustomCenter() {
        // Given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else { return false }

            if level == "gold" {
                return true
            } else {
                return false
            }
        }

        // When
        user.upgrade(using: center)

        // Then
        wait(for: [expectation], timeout: 3)
    }
}

//
//  LoggerTests.swift
//  MixpanelDemo
//
//  Created by Sam Green on 7/8/16.
//  Copyright © 2016 Mixpanel. All rights reserved.
//

import Foundation
import XCTest
@testable import Mixpanel

class LoggerTests: XCTestCase {


    func testEnableDebug() {
        let counter = CounterLogging()
        Logger.addLogging(counter)
        Logger.enableLevel(.debug)

        Logger.debug(message: "logged")
        XCTAssertEqual(1, counter.count)
    }

    func testEnableInfo() {
        let counter = CounterLogging()
        Logger.addLogging(counter)
        Logger.enableLevel(.info)
        Logger.info(message: "logged")
        XCTAssertEqual(1, counter.count)
    }

    func testEnableWarning() {
        let counter = CounterLogging()
        Logger.addLogging(counter)
        Logger.enableLevel(.warning)
        Logger.warn(message: "logged")
        XCTAssertEqual(1, counter.count)
    }

    func testEnableError() {
        let counter = CounterLogging()
        Logger.addLogging(counter)
        Logger.enableLevel(.error)
        Logger.error(message: "logged")
        XCTAssertEqual(1, counter.count)
    }

    func testDisabledLogging() {
        let counter = CounterLogging()
        Logger.addLogging(counter)
        Logger.disableLevel(.debug)
        Logger.debug(message: "not logged")
        XCTAssertEqual(0, counter.count)

        Logger.disableLevel(.error)
        Logger.error(message: "not logged")
        XCTAssertEqual(0, counter.count)

        Logger.disableLevel(.info)
        Logger.info(message: "not logged")
        XCTAssertEqual(0, counter.count)

        Logger.disableLevel(.warning)
        Logger.warn(message: "not logged")
        XCTAssertEqual(0, counter.count)
    }
}

/// This is a stub that implements `Logging` to be passed to our `Logger` instance for testing
class CounterLogging: Logging {
    var count = 0

    func addMessage(message: LogMessage) {
        count = count + 1
    }
}

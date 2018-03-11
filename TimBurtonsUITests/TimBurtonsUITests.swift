//
//  TimBurtonsUITests.swift
//  TimBurtonsUITests
//
//  Created by Siddhesh Mahadeshwar on 11/03/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import XCTest
@testable import TimBurtons
class TimBurtonsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

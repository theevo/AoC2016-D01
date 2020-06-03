//
//  AoC2016_D01Tests.swift
//  AoC2016-D01Tests
//
//  Created by Theo Vora on 6/3/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import XCTest
@testable import AoC2016_D01

class AoC2016_D01Tests: XCTestCase {
    
    var sut: Position!

    override func setUpWithError() throws {
        super.setUp()
        sut = Position()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testStartingPosition() {
        XCTAssertEqual(sut.coordinatesAsString, "(0,0) facing north", "Starting position is not correct. Expected 0,0 facing north.")
    }

}

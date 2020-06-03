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
    
    func testTurningLeft() throws {
        let leftTurn = "L"
        let newDirection = try XCTUnwrap(sut.heading.turn(leftOrRight: leftTurn))
        
        XCTAssertEqual(newDirection, .west, "Turning L from North should be West.")
    }
    
    func testTurningRight() throws {
        let rightTurn = "R"
        let newDirection = try XCTUnwrap(sut.heading.turn(leftOrRight: rightTurn))
        
        XCTAssertEqual(newDirection, .east, "Turning R from North should be East.")
    }
    
    func testTurnInitWithString() throws {
        let turnL = try XCTUnwrap(Turn(leftOrRight: "L"))
        
        XCTAssertEqual(turnL, .left, "Initializing a Turn with L should yield .left")
        
        let turnR = try XCTUnwrap(Turn(leftOrRight: "R"))
        
        XCTAssertEqual(turnR, .right, "Initializing a Turn with R should yield .right")
    }

}

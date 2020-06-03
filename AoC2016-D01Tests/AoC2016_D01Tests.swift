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
    
    func testTurnLeft() throws {
        var direction: Direction = .north
        
        direction = direction.turnLeft()
        
        XCTAssertEqual(direction, .west, "Turning L from North should be West.")
        
        direction = direction.turnLeft()
        
        XCTAssertEqual(direction, .south, "Turning L from West should be South.")
        
        direction = direction.turnLeft()
        
        XCTAssertEqual(direction, .east, "Turning L from South should be East.")
        
        direction = direction.turnLeft()
        
        XCTAssertEqual(direction, .north, "Turning L from East should be North.")
        
    }
    
    func testTurningRight() throws {
        var direction: Direction = .north
        
        direction = direction.turnRight()
        
        XCTAssertEqual(direction, .east, "Turning R from North should be East.")
        
        direction = direction.turnRight()
        
        XCTAssertEqual(direction, .south, "Turning R from West should be South.")
        
        direction = direction.turnRight()
        
        XCTAssertEqual(direction, .west, "Turning R from South should be West.")
        
        direction = direction.turnRight()
        
        XCTAssertEqual(direction, .north, "Turning R from West should be North.")
    }
    
    func testChangeDirection() {
        sut.changeDirection(.left)
        XCTAssertEqual(sut.heading, .west, "Turning L from North should yield West.")
        
        sut.changeDirection(.right)
        XCTAssertEqual(sut.heading, .north, "Turning R from West should yield North.")
    }
    
    func testExtractBearing() {
        var testString = "L9"
        
        var tuple = sut.extract(bearing: testString)
        
        XCTAssertEqual(tuple.turn, .left, "Fed L9 to Position.extract and expected left turn.")
        
        XCTAssertEqual(tuple.distance, 9, "Fed L9 to Position.extract and expected distance 9.")
        
        testString = "R150"
        
        tuple = sut.extract(bearing: testString)
        
        XCTAssertEqual(tuple.turn, .right, "Fed R150 to Position.extract and expected right turn.")
        
        XCTAssertEqual(tuple.distance, 150, "Fed R150 to Position.extract and expected distance 150.")
    }
    
    func testMove() {
        var bearing = "L33"
        
        sut.move(bearing: bearing)
        
        XCTAssertEqual(sut.coordinatesAsString, "(-33,0) facing west", "Postion.move was given L33 and expected coordinate to be -33, 0 facing west.")
        
        bearing = "L66"
        
        sut.move(bearing: bearing)
        
        XCTAssertEqual(sut.coordinatesAsString, "(-33,-66) facing south", "Postion.move was given L66 and expected coordinate to be -33, -66 facing south.")
        
        bearing = "R3"
        
        sut.move(bearing: bearing)
        
        XCTAssertEqual(sut.coordinatesAsString, "(-36,-66) facing west", "Postion.move was given L66 and expected coordinate to be -36, -66 facing west.")
        
        XCTAssertEqual(sut.distance, 102, "Expected distance to be 102 after 3 moves L33, L66, R3.")
    }

}

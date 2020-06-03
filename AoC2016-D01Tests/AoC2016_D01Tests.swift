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
    
    func testTurnInitWithString() throws {
        let turnL = try XCTUnwrap(Turn(leftOrRight: "L"))
        
        XCTAssertEqual(turnL, .left, "Initializing a Turn with L should yield .left")
        
        let turnR = try XCTUnwrap(Turn(leftOrRight: "R"))
        
        XCTAssertEqual(turnR, .right, "Initializing a Turn with R should yield .right")
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
        sut.changeDirection(leftOrRight: "L")
        XCTAssertEqual(sut.heading, .west, "Turning L from North should yield West.")
        
        sut.changeDirection(leftOrRight: "R")
        XCTAssertEqual(sut.heading, .north, "Turning R from West should yield North.")
    }
    
    

}

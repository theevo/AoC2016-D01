//
//  Position.swift
//  AoC2016-D01
//
//  Created by Theo Vora on 6/3/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import Foundation

class Position {
    private var x = 0
    private var y = 0
    var heading: Direction = .north
    
    var coordinatesAsString: String {
        print("(\(x),\(y)) facing \(heading)")
        return "(\(x),\(y)) facing \(heading)"
    }
}

extension Position {
    
    // MARK: - Main Functions
    
    func move(bearing: String) {
        let bearingTuple = extract(bearing: bearing)
        let turn = bearingTuple.turn
        let distance = bearingTuple.distance
        
        changeDirection(turn)
        advance(distance)
    }
    
    func advance(_ distance: Int) {
        let multiplier: Int = self.heading.value
        let direction = self.heading
        
        switch direction {
        case .east, .west:
            x =  x + (multiplier * distance)
        case .north, .south:
            y = y + (multiplier * distance)
        }
    }
    
    func changeDirection(_ turn: Turn) {
        switch turn {
        case .left:
            self.heading = self.heading.turnLeft()
        case .right:
            self.heading = self.heading.turnRight()
        }
    }
    
    
    // MARK: - Helper functions
    
    func extract(bearing: String) -> (turn: Turn, distance: Int) {
        var turn: Turn = .left
        let distance = Int(bearing.dropFirst()) ?? 0
        
        if bearing.contains("L") {
            turn = .left
        } else if bearing.contains("R") {
            turn = .right
        }
        
        return (turn,distance)
    }
}

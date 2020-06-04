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
        return "(\(x),\(y)) facing \(heading)"
    }
    
    var distance: Int {
        let eastWest = abs(x)
        let northSouth = abs(y)
        return eastWest + northSouth
    }
    
    convenience init(x: Int, y: Int, heading: Direction) {
        self.init()
        self.x = x
        self.y = y
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
        let multiplier: Int = self.heading.value // 1 or -1
        let direction = self.heading
        
        for _ in 0..<distance {
            switch direction {
            case .east, .west:
                x += multiplier
            case .north, .south:
                y += multiplier
            }
            
            let copy = self.copy()
            PositionController.shared.log(position: copy)
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
    
    func copy() -> Position {
        let copy = Position(x: self.x, y: self.y, heading: self.heading)
        return copy
    }
}

extension Position: Equatable {
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Position: CustomStringConvertible {
    var description: String {
        return "(\(x),\(y))"
    }
}

extension Position: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

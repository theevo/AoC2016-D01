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
    func changeDirection(leftOrRight: String) {
        guard leftOrRight.count == 1 else { return }
        
        guard leftOrRight == "L" || leftOrRight == "R" else { return }
        
        let newDirection = self.heading.turn(leftOrRight: leftOrRight)
        self.heading = newDirection!
    }
}

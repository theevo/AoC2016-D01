//
//  Direction.swift
//  AoC2016-D01
//
//  Created by Theo Vora on 6/3/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import Foundation

enum Direction {
    case north
    case south
    case east
    case west
    
    var value: Int {
        switch self {
        case .north:
            return 1
        case .south:
            return -1
        case .east:
            return 1
        case .west:
            return -1
        }
    }
    
    func turn(leftOrRight: String) -> Direction? {
        if leftOrRight == "L" {
            switch self {
            case .north:
                return .west
            case .south:
                return .east
            case .east:
                return .north
            case .west:
                return .south
            }
        } else if leftOrRight == "R" {
            switch self {
            case .north:
                return .east
            case .south:
                return .west
            case .east:
                return .south
            case .west:
                return .north
            }
        }
        
        return nil
    }
}


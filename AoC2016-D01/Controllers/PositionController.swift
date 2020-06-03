//
//  PositionController.swift
//  AoC2016-D01
//
//  Created by Theo Vora on 6/3/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import Foundation

class PositionController {
    
    var position = Position()
    let easyMockData = ["R2", "L3", "R2", "R4", "L2"]
    
    init() {
        for bearing in easyMockData {
            position.move(bearing: bearing)
        }
        
        print(position.coordinatesAsString)
    }
    
    
}

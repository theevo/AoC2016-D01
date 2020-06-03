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
    var instructionSequence: [String] = []
    var visitedLocations: [Position] = []
    
    init() {
        // Append starting position of (0,0)
        visitedLocations.append(position.copy())
        
        loadInputFile()
    }
    
    func run() {
        for bearing in instructionSequence {
            position.move(bearing: bearing)
            visitedLocations.append(position.copy())
        }
    }
    
    func firstLocationVisitedTwice() -> Position? {
        let mappedItems = visitedLocations.map { ($0, 1) }
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
        let duplicates = visitedLocations.filter { num in
            counts[num] == 2
        }
        
        
        print(duplicates)
        
        return duplicates.first
        
    }
    
    
    private func loadInputFile() {
        if let filepath = Bundle.main.path(forResource: "inputEasterBunnyInstructions", ofType: "") {
            do {
                let contents = try String(contentsOfFile: filepath)
                instructionSequence = contents.components(separatedBy: ", ")
            } catch {
                print(error)
            }
        } else {
            print("didn't find the file!")
        }
    }
}

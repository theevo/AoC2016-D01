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
    
    init() {
        loadInputFile()
    }
    
    func loadInputFile() {
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

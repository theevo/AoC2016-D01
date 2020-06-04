//
//  ViewController.swift
//  AoC2016-D01
//
//  Created by Theo Vora on 6/3/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        launch()
    }
    
    func launch() {
        
        PositionController.shared.loadInputFile()
        PositionController.shared.run()
        
        print("Part 1 position: \(PositionController.shared.position.coordinatesAsString)")
        print("Distance to part 1 position: \(PositionController.shared.position.distance)")
        print("Visited Locations:")
        print(PositionController.shared.visitedLocations)
        
        
        guard let finalPosition = PositionController.shared.firstLocationVisitedTwice() else { return }
        
        print("Part 2 position: \(finalPosition)")
        print("Distance to Part 2 position: \(finalPosition.distance)")
    }
}


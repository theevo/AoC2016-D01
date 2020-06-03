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
        
        loadPositionController()
    }
    
    func loadPositionController() {
        let pc = PositionController()
        
        pc.run()
        
        print("Part 1 position: \(pc.position.coordinatesAsString)")
        print("Distance to part 1 position: \(pc.position.distance)")
        print("Visited Locations:")
        print(pc.visitedLocations)
        
        
        guard let finalPosition = pc.firstLocationVisitedTwice() else { return }
        
        print("Part 2 position: \(finalPosition)")
        print("Distance to Part 2 position: \(finalPosition.distance)")
    }
}


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
        
        print("Final position: \(pc.position.coordinatesAsString)")
        print("Distance from starting position: \(pc.position.distance)")
        print("Visited Locations:")
        print(pc.visitedLocations)
    }
}


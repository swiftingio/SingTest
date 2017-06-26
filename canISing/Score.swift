//
//  Score.swift
//  canISing
//
//  Created by woroninb on 20/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation

enum Score: Int {
    case bad
    case good
    case excellent
    
    var score: Int {
        switch self.score {
        case 0..<20:
            return 0
        case 5..<100:
            return 1
        case _ where self.score > 100:
            return 2
        default:
            return 3
        }
    }
}

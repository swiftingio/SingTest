//
//  Dimensions.swift
//  canISing
//
//  Created by woroninb on 14/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit

struct Dimensions {
    static let maxFrequency: Float = 1000.0
    static let resolution: Float = 0.02
    static let minAmplitude: Double = 0.01
    static let noteBarHeight: Float = 10
    static let width = Float(UIScreen.main.bounds.width)
    static let height = Float(UIScreen.main.bounds.height)
    static let scale = height / maxFrequency
    static let timeAccuracy: Float = 50
}

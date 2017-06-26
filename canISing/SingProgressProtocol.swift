//
//  SingProtocol.swift
//  SingTest
//
//  Created by woroninb on 25/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation
import AudioKit


protocol SingProgressProtocol {
    var tracker: AKFrequencyTracker! { get set }
    var progressX: Float { get set }
    func setSingProgress(completion: (_ index: Int,_ frequency: Float) -> Void)
}

extension SingProgressProtocol {
    
    func setSingProgress(completion: (_ index: Int, _ frequency: Float) -> Void) {
        
        if tracker.amplitude > Dimensions.minAmplitude {
            
            var frequency = Float(tracker.frequency)
            
            while frequency > Float(MusicConst.noteFrequencies[MusicConst.noteFrequencies.count - 1]) {
                frequency /= 2.0
            }
            while frequency < Float(MusicConst.noteFrequencies[0]) {
                frequency *= 2.0
            }
            var minDistance: Float = 10_000.0
            var index = 0
            
            for i in 0..<MusicConst.noteFrequencies.count {
                let distance = fabsf(Float(MusicConst.noteFrequencies[i]) - frequency)
                if distance < minDistance {
                    index = i
                    minDistance = distance
                }
            }
            completion(index, frequency)
        }
    }
}

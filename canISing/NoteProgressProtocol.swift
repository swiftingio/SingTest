//
//  NoteProgressProtocol.swift
//  canISing
//
//  Created by woroninb on 21/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation

protocol NoteProgressProtocol: class {
    var timer: Timer? { get set }
    var notes: [NoteProgressBar] { get set }
    var testDuration: Float { get }
    var deltaX: Float { get }
    func setPianoProgress(withTime time: Float)
}

extension NoteProgressProtocol {
    
    var testDuration: Float {
        return notes.reduce(0.0) { $0 + $1.duration } // in miliseconds
    }
    
    var deltaX: Float {
        return Dimensions.width / (testDuration * Dimensions.resolution)
    }
    
    func setPianoProgress(withTime time: Float) {
        
        if(time > testDuration) {
            timer?.invalidate()
        }
        
        for (index, note) in notes.enumerated() {
            
            let currentTimeSum = notes.filter { notes.index(of: $0)! < index }.reduce(0.0) { $0 + $1.duration }
            if time == Float(currentTimeSum) {
                print(currentTimeSum)
                note.startTimer()
            }
            
            guard let timer = note.timer else { return }
            
            if note.duration <= Float(timer.timeInterval * 1000) {
                note.tempProgress = note.tempProgress + deltaX
                note.setProgress(note.tempProgress / (Dimensions.width / Float(notes.count)), animated: true)
            }
        }
    }
}

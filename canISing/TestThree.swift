//
//  TestThree\.swift
//  canISing
//
//  Created by woroninb on 15/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation


struct TestThree: Test {
    
    let soundName: String = "3"
    let name: String = "Test Sound 3"
    let levelName: String = "Medium"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "D",
                 distance: 0,
                 frequency: 293.7),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "F#",
                 distance: 0,
                 frequency: 370.0),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "F#",
                 distance: 0,
                 frequency: 370.0),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "D",
                 distance: 0,
                 frequency: 293.7),
                        duration: 1000),
        
        ]
}

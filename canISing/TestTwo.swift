//
//  TestTwo.swift
//  canISing
//
//  Created by woroninb on 13/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation


struct TestTwo: Test {
    
    let soundName = "2"
    let name: String = "Test Sound 2"
    let levelName: String = "Medium"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 261.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "F",
                 distance: 0,
                 frequency: 349.2),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 261.6),
                        duration: 1000),
        
        ]
}

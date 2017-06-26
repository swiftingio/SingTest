//
//  TestFour.swift
//  canISing
//
//  Created by woroninb on 19/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation

struct TestFour: Test {
    
    let soundName: String = "4"
    let name: String = "Wlazł Kotek na płotek"
    let levelName: String = "Medium"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "F",
                 distance: 0,
                 frequency: 349.2),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "D",
                 distance: 0,
                 frequency: 293.7),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "D",
                 distance: 0,
                 frequency: 293.7),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 261.6),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 261.6),
                        duration: 1000),
        
    ]
}

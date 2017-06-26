//
//  TestSix.swift
//  canISing
//
//  Created by woroninb on 20/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation


import Foundation


struct TestSix: Test {
    
    let soundName: String = "6"
    let name: String = "Bill Withers: Ain't No Sunshine"
    let levelName: String = "Medium"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "A",
                 distance: 0,
                 frequency: 440.0),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 5,
                 pitch: "C",
                 distance: 0,
                 frequency: 523.3),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "H",
                 distance: 0,
                 frequency: 493.9),
                        duration: 500),
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 250),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "A",
                 distance: 0,
                 frequency: 440.0),
                        duration: 1000)
        
        
        ]
}

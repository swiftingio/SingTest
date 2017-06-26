//
//  TestFive.swift
//  canISing
//
//  Created by woroninb on 19/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation


struct TestFive: Test {
    
    let soundName: String = "5"
    let name: String = "The Police: Every breath you take"
    let levelName: String = "Medium"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "H",
                 distance: 0,
                 frequency: 493.9),
                        duration: 250),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 523.3),
                        duration: 250),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "H",
                 distance: 0,
                 frequency: 493.9),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "A",
                 distance: 0,
                 frequency: 440.0),
                        duration: 500),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 2500),
        
        ]
}

//
//  SingTests.swift
//  canISing
//
//  Created by woroninb on 13/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation


struct TestOne: Test {
    
    let soundName: String = "1"
    let name: String = "Test Sound 1"
    let levelName: String = "Easy"
    
    var notes: [NoteProgressBar] = [
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "C",
                 distance: 0,
                 frequency: 261.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "E",
                 distance: 0,
                 frequency: 329.6),
                        duration: 1000),
        
        NoteProgressBar(note:
            Note(octave: 4,
                 pitch: "G",
                 distance: 0,
                 frequency: 392.0),
                        duration: 1000)]
}

//
//  File.swift
//  canISing
//
//  Created by woroninb on 14/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation

protocol Test {
    var notes: [NoteProgressBar] { get set }
    var soundName: String { get }
    var levelName: String { get }
    var name: String { get }
}

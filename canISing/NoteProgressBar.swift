//
//  NoteProgressBar.swift
//  canISing
//
//  Created by woroninb on 30/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit

class NoteProgressBar: UIProgressView {
    
    var note: Note!
    var duration: Float = 0 // in milisecons
    var tempProgress: Float = 0
    var downOctaveProgress: UIProgressView = UIProgressView()
    var timer: Timer?
    var downOctaveFreq: Float {
        return self.note.frequency / 2
    }
    
    init(note: Note, duration: Float) {
        super.init(frame: CGRect.zero)
        
        self.note = note
        self.duration = duration
        progressTintColor = UIColor.red.withAlphaComponent(0.6)
        progress = 0
        trackTintColor = UIColor.red.withAlphaComponent(0.3)
        
        downOctaveProgress.progress = 0
        downOctaveProgress.trackTintColor = UIColor.blue.withAlphaComponent(0.3)
        downOctaveProgress.progressTintColor = UIColor.blue.withAlphaComponent(0.6)
        
        downOctaveProgress.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(downOctaveProgress)
    }
    
    func clear(withAlhpa alpha: CGFloat = 1) {
        tempProgress = 0
        progress = 0
        timer?.invalidate()
        timer = nil
        downOctaveProgress.progress = 0
        self.alpha = alpha
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration / 1000), target: self, selector:#selector(stopTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if let timer = timer {
            if(timer.timeInterval == Double(duration / 1000.0)) {
                timer.invalidate()
            }
        }
    }
}

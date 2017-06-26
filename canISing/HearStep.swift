//
//  HearStep.swift
//  canISing
//
//  Created by woroninb on 28/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit
import ResearchKit
import TuningFork
import AudioKit

class HearStepViewController: ORKStepViewController, NoteProgressProtocol, PlaySoundProtocol  {
    
    var player: AVAudioPlayer?
    fileprivate var tuner: Tuner?
    var singTest: Test?
    var notes: [NoteProgressBar] = []
    
    var timer: Timer?
    var time : Float = 0.0
    var progressX: Float = 0
    
    fileprivate var mic: AKMicrophone!
    fileprivate var tracker: AKFrequencyTracker!
    fileprivate var silence: AKBooster!
    
    fileprivate let noteLabel: UILabel = UILabel()
    fileprivate let nextButton = RoundedButton()
    fileprivate let repeatButton = RoundedButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureConstraints()
    }
    
    deinit {
        print("deinit hear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AudioKit.output = silence
        AudioKit.start()
        
        playSound()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AudioKit.stop()
        
        timer?.invalidate()
        timer = nil
        time = 0
        progressX = 0
        
        _ = notes.map {
            $0.clear()
        }
        notes = []
    }
    
    private func configure() {
        
        singTest = (step as? HearStep)?.test
        notes = singTest?.notes ?? []
        
        timer = Timer.scheduledTimer(timeInterval: Dimensions.timeAccuracy / 1000, target: self, selector:#selector(setProgress), userInfo: nil, repeats: true)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(goNextPressed), for: .touchUpInside)
        
        repeatButton.setTitle("Repeat", for: .normal)
        repeatButton.addTarget(self, action: #selector(repeatButtonPressed), for: .touchUpInside)
        
        noteLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        noteLabel.textAlignment = .center
        
        _ = notes.map {
            view.addSubview($0)
        }
        
        view.addSubview(nextButton)
        view.addSubview(repeatButton)
        view.addSubview(noteLabel)
        
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    private func configureConstraints() {
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constrains: [NSLayoutConstraint] = []
        
        constrains.append(noteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constrains.append(noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constrains.append(noteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        for (index, note) in notes.enumerated() {
            
            let previousLeading = index == 0 ? view.leadingAnchor : notes[index - 1].trailingAnchor
            
            constrains.append(note.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(note.note.frequency * Dimensions.scale)))
            constrains.append(note.leadingAnchor.constraint(equalTo: previousLeading))
            constrains.append(note.heightAnchor.constraint(equalToConstant: CGFloat(Dimensions.noteBarHeight)))
            constrains.append(note.widthAnchor.constraint(equalToConstant: CGFloat(Dimensions.width * note.duration / testDuration)))
        }
        
        constrains.append(repeatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8))
        constrains.append(repeatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50))
        constrains.append(nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8))
        constrains.append(nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50))
        
        NSLayoutConstraint.activate(constrains)
    }
    
    func goNextPressed() {
        self.goForward()
        player?.stop()
    }
    
    func repeatButtonPressed() {
        
        _ = notes.map {
            $0.clear()
        }
        time = 0
        timer?.invalidate()
        timer = nil
    
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector:#selector(setProgress), userInfo: nil, repeats: true)
        
        playSound()
    }
    
    func setProgress() {

        setPianoProgress(withTime: time)
        
        time = time + Dimensions.timeAccuracy
        progressX = progressX + deltaX

    }
}

class HearStep: ORKStep {
    
    var test: Test?
    
    override init(identifier: String) {
        super.init(identifier: identifier)
    }
    
    override func stepViewControllerClass() -> AnyClass {
        return HearStepViewController.self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

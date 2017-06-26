//
//  SingStep.swift
//  canISing
//
//  Created by woroninb on 27/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit
import ResearchKit
import TuningFork
import AudioKit
import UICircularProgressRing

class SingStepViewController: ORKStepViewController, NoteProgressProtocol, SingProgressProtocol {
    
    var timer: Timer?
    var singTest: Test?
    var notes: [NoteProgressBar] = []
    
    fileprivate let waitDuration: CGFloat = 4
    fileprivate var time : Float = 0.0
    var progressX: Float = 0
    fileprivate var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    fileprivate var silence: AKBooster!
    
    fileprivate let nextButton = UIButton(type: .system)
    fileprivate let noteLabel: UILabel = UILabel()
    fileprivate let repeatButton = RoundedButton(frame: CGRect.zero)
    fileprivate let draftView = UIView()
    fileprivate let progressRingView = UICircularProgressRingView()
    fileprivate let startSingLabel = UILabel()
    fileprivate let topMarginOffset = 64
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configure()
        configureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AudioKit.output = silence
        AudioKit.start()
        
        UIView.animate(withDuration: 0.5,
                       delay: TimeInterval(waitDuration - CGFloat(0.5)),
                       options: .curveLinear,
                       animations: {
                        
                    _ = self.notes.map {
                            $0.alpha = 1
                    }
        })
        
        progressRingView.setProgress(value: 0, animationDuration: 4.0) {
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AudioKit.stop()
        timer?.invalidate()
        timer = nil
        time = 0
        
        _ = notes.map {
            $0.clear()
        }
    }
    
    private func configure() {
        
        singTest = (step as? SingStep)?.test
        notes = singTest?.notes ?? []
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(goNextPressed), for: .touchUpInside)
        nextButton.isHidden = true
        
        repeatButton.setTitle("Repeat", for: .normal)
        repeatButton.addTarget(self, action: #selector(repeatButtonPressed), for: .touchUpInside)
        repeatButton.layer.borderWidth = 1.0
        repeatButton.layer.cornerRadius = 5.0
        
        noteLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        noteLabel.textAlignment = .center
        noteLabel.textColor = .black
        
        startSingLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        startSingLabel.textAlignment = .center
        startSingLabel.textColor = .black
        startSingLabel.text = "Start sing in"
        
        _ = notes.map {
            $0.alpha = 0
            view.addSubview($0)
        }
        
        view.addSubview(draftView)
        view.addSubview(nextButton)
        view.addSubview(repeatButton)
        view.addSubview(progressRingView)
        view.addSubview(startSingLabel)
        view.addSubview(noteLabel)
        
        progressRingView.maxValue = waitDuration
        progressRingView.value = waitDuration
        progressRingView.outerRingWidth = 1.0
        progressRingView.innerRingWidth = 1.0
        progressRingView.viewStyle = 2
        progressRingView.innerRingColor = .white
        progressRingView.outerRingColor = #colorLiteral(red: 0.7366499305, green: 0.3746042848, blue: 0.3821410239, alpha: 1)
        progressRingView.valueIndicator = ""
        progressRingView.startAngle = 270
        progressRingView.delegate = self
        
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    
    }
    
    private func configureConstraints() {
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        draftView.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        progressRingView.translatesAutoresizingMaskIntoConstraints = false
        startSingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constrains: [NSLayoutConstraint] = []
        
        constrains.append(startSingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constrains.append(startSingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constrains.append(startSingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constrains.append(progressRingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55))
        constrains.append(progressRingView.heightAnchor.constraint(equalToConstant: 70))
        constrains.append(progressRingView.widthAnchor.constraint(equalToConstant: 70))
        constrains.append(progressRingView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constrains.append(noteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constrains.append(noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constrains.append(noteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        for (index, note) in notes.enumerated() {
            
            let previousLeading = index == 0 ? view.leadingAnchor : notes[index - 1].trailingAnchor
            
            constrains.append(note.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(Float(note.note.frequency) * Dimensions.scale)))
            constrains.append(note.leadingAnchor.constraint(equalTo: previousLeading))
            constrains.append(note.heightAnchor.constraint(equalToConstant: CGFloat(Dimensions.noteBarHeight)))
            constrains.append(note.widthAnchor.constraint(equalToConstant: CGFloat(Dimensions.width * note.duration / testDuration)))
            
            constrains.append(note.downOctaveView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(note.downOctaveFreq * Dimensions.scale)))
            constrains.append(note.downOctaveView.leadingAnchor.constraint(equalTo: previousLeading))
            constrains.append(note.downOctaveView.heightAnchor.constraint(equalToConstant: CGFloat(Dimensions.noteBarHeight)))
            constrains.append(note.downOctaveView.widthAnchor.constraint(equalToConstant:CGFloat(Dimensions.width * note.duration / testDuration)))
        }

        constrains.append(repeatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12))
        constrains.append(repeatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constrains.append(nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12))
        constrains.append(nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50))
        
        constrains.append(draftView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor))
        constrains.append(draftView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constrains.append(draftView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constrains.append(draftView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor))
        
        NSLayoutConstraint.activate(constrains)
    }
    
    func setProgress() {
        
        setSingProgress { (index, frequency) in
            
            let y = Int(Dimensions.height - tracker.frequency * Dimensions.scale - topMarginOffset - Dimensions.noteBarHeight)
            let octave = Int(log2f(Float(tracker.frequency) / frequency))
            let soundSampleView = UIView(frame: CGRect(x: Int(progressX) - 1,
                                                       y: y,
                                                       width: Int(deltaX),
                                                       height: Int(Dimensions.noteBarHeight)))
            soundSampleView.backgroundColor = .blue
            soundSampleView.alpha = 0.5
            draftView.addSubview(soundSampleView)
            noteLabel.text = "\(MusicConst.noteNamesWithSharps[index])\(octave)"
        }

        setPianoProgress(withTime: time)
        time = time + Dimensions.timeAccuracy
        progressX = progressX + deltaX
    }
    
    func goNextPressed() {
        self.goForward()
    }
    
    func repeatButtonPressed() {

        _ = notes.map {
            $0.clear(withAlhpa: 0)
        }
        
        _ = draftView.subviews.map {
            $0.removeFromSuperview()
        }
        
        noteLabel.isHidden = true
        progressRingView.isHidden = false
        startSingLabel.isHidden = false
        timer?.invalidate()
        progressX = 0
        time = 0
        
        UIView.animate(withDuration: 0.5,
                       delay: TimeInterval(waitDuration - CGFloat(0.5)),
                       options: .curveLinear,
                       animations: {
                        
                        _ = self.notes.map {
                            $0.alpha = 1
                        }

        })
        
        progressRingView.setProgress(value: 0, animationDuration: TimeInterval(waitDuration)) {
            self.noteLabel.isHidden = false
        }
    }
}

extension SingStepViewController: UICircularProgressRingDelegate {
    func finishedUpdatingProgress(forRing ring: UICircularProgressRingView) {
        if ring.currentValue == 0 {
            progressRingView.isHidden = true
            progressRingView.value = 4
            startSingLabel.isHidden = true
            
            timer = Timer.scheduledTimer(timeInterval: Dimensions.timeAccuracy / 1000, target: self, selector:#selector(setProgress), userInfo: nil, repeats: true)
        }
    }
}

class SingStep: ORKActiveStep {
    
    var test: Test?
    
    override init(identifier: String) {
        super.init(identifier: identifier)
    }
    
    override func stepViewControllerClass() -> AnyClass {
        return SingStepViewController.self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


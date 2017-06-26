//
//  InfoStep.swift
//  canISing
//
//  Created by woroninb on 23/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit
import ResearchKit

class InfoStepViewController: ORKStepViewController {
    
    fileprivate var label = UILabel()
    fileprivate var nextStepButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(step: ORKStep?) {
        super.init(step: step)
    }
    
    override init(step: ORKStep, result: ORKResult) {
        super.init(step: step, result: result)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func hasNextStep() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        label.text = "Here you have"
        label.font = UIFont(name: "Helvetica", size: 18.0)
        
        nextStepButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextStepButton.setTitle("Next", for: .normal)
        
        view.addSubview(label)
        view.addSubview(nextStepButton)
        
        configureConstraints()
    }
    
    func nextPressed() {
        self.goForward()
    }
    
    private func configureConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        nextStepButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(label.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(label.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(label.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraints.append(nextStepButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor))
        constraints.append(nextStepButton.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(nextStepButton.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

class InfoStep: ORKStep {

    override init(identifier: String) {
        super.init(identifier: identifier)
    }
    
    override func stepViewControllerClass() -> AnyClass {
         return InfoStepViewController.self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

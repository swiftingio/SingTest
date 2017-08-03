//
//  ViewController.swift
//  canISing
//
//  Created by woroninb on 08/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit
import AVFoundation
import ResearchKit
import TuningFork

class SingTestListController: UITableViewController, ORKTaskViewControllerDelegate{
    
    var tests: [Test] {
        return [TestOne(), TestTwo(), TestThree(), TestFour(), TestFive(), TestSix()]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sing Test"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: String(describing: TestTableViewCell.self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestTableViewCell.self), for: indexPath) as? TestTableViewCell else {
            return UITableViewCell()
        }
        
        cell.testNameLabel.text = tests[indexPath.row].name
        cell.levelLabel.text = tests[indexPath.row].levelName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let hearStep = HearStep(identifier: "hear")
        hearStep.test = tests[indexPath.row]
        
        let singStep = SingStep(identifier: "sing")
        singStep.shouldShowDefaultTimer = true
        singStep.shouldVibrateOnStart = true
        singStep.test = tests[indexPath.row]
        
        let task = ORKOrderedTask(identifier: "task", steps: [hearStep, singStep])
    
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self

        present(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}





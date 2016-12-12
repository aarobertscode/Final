//
//  ViewController.swift
//  SingleViewAppSwift2Template
//
//  Created by Treehouse on 9/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
import UIKit
import GameKit
class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func button1() {
    }
    @IBAction func button2() {
    }
    @IBAction func button3() {
    }
    @IBAction func button4() {
    }
    @IBAction func button5() {
    }
    @IBAction func button6() {
    }
   c
    override func viewDidLoad() {
        super.viewDidLoad()
        var indexOne: Int = 0
        var indexTwo: Int = 0
        var indexThree: Int = 0
        var indexFour: Int = 0
        
        while (indexOne == indexTwo) && (indexTwo == indexThree) && (indexOne == indexThree) && (indexOne == indexFour) && (indexTwo == indexFour) && (indexThree == indexFour) {
            indexOne = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            indexTwo = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            indexThree = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            indexFour = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        }
        label1.text = events[indexOne]
        label2.text = events[indexTwo]
        label3.text = events[indexThree]
        label4.text = events[indexFour]
        startTimer()
    }
    // [Counts down 60 seconds] Working on modifying score accordlny
    var seconds
    var timer = Timer()
    func startTimer() {
        seconds = 60
        self.timer = Timer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timerFire(_:)), userInfo: nil, repeats: true)
    }
    
    func timerFire(timer: Timer) {
        seconds -= 1
        timerLabel.text = "\(seconds)"
    }

    
    
    
 
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

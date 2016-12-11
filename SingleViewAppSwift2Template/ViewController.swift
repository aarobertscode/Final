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
    @IBOutlet weak var scoreLabel: UILabel!
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
    // [Sorts events randomly on labels] Not sure why this isn't working
    var events: [String] = ["First", "Third", "Second", "Forth"]
    override func viewDidLoad() {
        super.viewDidLoad()
        var index1: Int = 0
        var index2: Int = 0
        var index3: Int = 0
        var index4: Int = 0
        
        while (index1 == index2) && (index2 == index3) && (index1 == index3) && (index1 == index4) && (index2 == index4) && (index3 == index4) {
            index1 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index2 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index3 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index4 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        }
        label1.text = events[index1]
        label2.text = events[index2]
        label3.text = events[index3]
        label4.text = events[index4]
    }
   // [Counts down 60 seconds] Working on modifying score accordlny
    var score = 0
    var count = 60
    var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("counter")), userInfo: nil, repeats: true)
    func counter() {
        
        if(count > 0)
        {
            count -= 1
            timerLabel.text = String(count)
        } else {
            timer.invalidate()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


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
 
    // [Sorts events randomly on labels] Not sure why this isn't working
    var allEvents: [String] = ["SOUTHERN STATES PASS LAWS TO DISENFRANCISE BLACKS", "THEODORE ROOSEVELT ELECTED VICE PRESIDENT", "WRIGHT BROTHERS FIRST FLIGHT", "SAN FRANCISCO EARTHQUAKE", "FORD INTRODUCES MODEL T", "WORLD WAR I BEGINS IN EUROPE", "WORLD WAR I ENDS", "TR DIES – CARNEGIE DIES", "GERMAN MONEY HYPER INFLATES", "TREATY OF VERSAILLES, 19TH AMENDMENT", "HINDENBURG ELECTED PRESIDENT OF GERMANY", "STOCK MARKET CRASHES, DEPRESSION BEGINS", "HITLER’S NAZI PARTY GAINS MAJORITY IN PARLIAMENT", "HITLER BEGINS TO TAKE POWER IN GERMANY", "FRANKLIN ROOSEVELT ELECTED PRESIDENT", "FDR INAUGURATED “100 DAYS”", "HINDENBURG DIES, HITLER APPOINTS HIMSELF PRESIDENT  -  “ FUEHRER”", "FDR RE-ELECTED", "German airship HINDENBURG BURNS IN NEW JERSEY", "“MUNICH” – British P.M. Chamberlain agrees that Hitler can have Czechoslovakia.", "Germany invades Holland, Belgium and France – Churchill becomes P.M.", "Germany invades Russia", "JAPANESE ATTACK PEARL HARBOR – U.S. DECLARES WAR ON JAPAN", "HITLER DECLARES WAR ON U.S."]
    var eventIndex1: Int = 0
    var eventIndex2: Int = 0
    var eventIndex3: Int = 0
    var eventIndex4: Int = 0
 /****/   while (eventIndex1 == eventIndex2) && (eventIndex2 == eventIndex3) && (eventIndex1 == eventIndex3) && (eventIndex1 == eventIndex4) && (eventIndex2 == eventIndex4) && (eventIndex3 == eventIndex4) {
        eventIndex1 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
        eventIndex2 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
        eventIndex3 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
        eventIndex4 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
    }
    var event1 = allEvents[eventIndex1]
    var event2 = allEvents[eventIndex2]
    var event3 = allEvents[eventIndex3]
    var event4 = allEvents[eventIndex4]
    
   
    var events: [String] = [event1, event2, event3, event4]

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

    var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "counter", userInfo: nil, repeats: true)
    var count = 60
    func counter() {
        if(count > 0) {
            count -= 1
            timerLabel.text = String(count)
        } else {
            timer.invalidate()
            timerLabel.text = "0"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


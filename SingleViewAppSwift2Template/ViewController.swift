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
    var allEvents: [String] = ["SOUTHERN STATES PASS LAWS TO DISENFRANCISE BLACKS", "THEODORE ROOSEVELT ELECTED VICE PRESIDENT", "WRIGHT BROTHERS FIRST FLIGHT", "SAN FRANCISCO EARTHQUAKE", "FORD INTRODUCES MODEL T", "WORLD WAR I BEGINS IN EUROPE", "WORLD WAR I ENDS", "TR DIES – CARNEGIE DIES", "GERMAN MONEY HYPER INFLATES", "TREATY OF VERSAILLES, 19TH AMENDMENT", "HINDENBURG ELECTED PRESIDENT OF GERMANY", "STOCK MARKET CRASHES, DEPRESSION BEGINS", "HITLER’S NAZI PARTY GAINS MAJORITY IN PARLIAMENT", "HITLER BEGINS TO TAKE POWER IN GERMANY", "FRANKLIN ROOSEVELT ELECTED PRESIDENT", "FDR INAUGURATED “100 DAYS”", "HINDENBURG DIES, HITLER APPOINTS HIMSELF PRESIDENT  -  “ FUEHRER”", "FDR RE-ELECTED", "German airship HINDENBURG BURNS IN NEW JERSEY", "“MUNICH” – British P.M. Chamberlain agrees that Hitler can have Czechoslovakia.", "Germany invades Holland, Belgium and France – Churchill becomes P.M.", "Germany invades Russia", "JAPANESE ATTACK PEARL HARBOR – U.S. DECLARES WAR ON JAPAN", "HITLER DECLARES WAR ON U.S."]
    var eventIndex1: Int = 0
    var eventIndex2: Int = 0
    var eventIndex3: Int = 0
    var eventIndex4: Int = 0
    
    func generateRandomIndex() -> [Int] {
        while (eventIndex1 == eventIndex2) && (eventIndex2 == eventIndex3) && (eventIndex1 == eventIndex3) && (eventIndex1 == eventIndex4) && (eventIndex2 == eventIndex4) && (eventIndex3 == eventIndex4) {
            eventIndex1 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
            eventIndex2 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
            eventIndex3 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
            eventIndex4 = GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)
        }
        return [eventIndex1, eventIndex2, eventIndex3, eventIndex4]
    }
    
    var eventIndexes = generateRandomIndex()
    var index1 = eventIndexes[0]
    var index2 = eventIndexes[1]
    var index3 = eventIndexes[2]
    var index4 = eventIndexes[3]
    var event1 = allEvents[index1]
    var event2 = allEvents[index2]
    var event3 = allEvents[index3]
    var event4 = allEvents[index4]
    
    var events: [String] = [event1, event2, event3, event4]
    
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

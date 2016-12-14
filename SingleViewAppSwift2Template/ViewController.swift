//
//  ViewController.swift
//  SingleViewAppSwift2Template
//
//  Created by Treehouse on 9/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

//implent starter view, implent ending view, repeats??, fix UI
import UIKit
import GameKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var seconds: Int = 60
    var score: Int = 0
    var round: Int = 0
    
    
    @IBOutlet weak var scoree: UILabel!
    @IBAction func nextRoundButton() {
        events = [""]
        addRandomEvent()
        setStarterLabels()
        seconds = 60
        startTimer()
        nextRoundButtonOutlet.isHidden = true
        timerLabel.isHidden = false
        
    }
    @IBOutlet weak var nextRoundButtonOutlet: UIButton!
    @IBAction func button1() {
        let tempLabel1 = label1.text
        let tempLabel2 = label2.text
        
        label2.text = tempLabel1
        label1.text = tempLabel2
    }
    @IBAction func button2() {
    
        let tempLabel1 = label1.text
        let tempLabel2 = label2.text
    
        label1.text = tempLabel2
        label2.text = tempLabel1
    }
    @IBAction func button3() {
        let tempLabel2 = label2.text
        let tempLabel3 = label3.text
        
        label3.text = tempLabel2
        label2.text = tempLabel3
        
    }
    @IBAction func button4() {
        let tempLabel3 = label3.text
        let tempLabel2 = label2.text
        
        label3.text = tempLabel2
        label2.text = tempLabel3
    }
    @IBAction func button5() {
        let tempLabel3 = label3.text
        let tempLabel4 = label4.text
        
        label4.text = tempLabel3
        label3.text = tempLabel4
    }
    @IBAction func button6() {
        let tempLabel3 = label3.text
        let tempLabel4 = label4.text
        label3.text = tempLabel4
        label4.text = tempLabel3
    }
    
    struct Event {
        let event: String
        let order: Int
    }
    var allEvents: [Event] = [Event(event: "SOUTHERN STATES PASS LAWS TO DISENFRANCISE BLACKS", order: 1), Event(event: "THEODORE ROOSEVELT ELECTED VICE PRESIDENT", order: 2), Event(event: "SAN FRANCISCO EARTHQUAKE", order: 3), Event(event: "FORD INTRODUCES MODEL T", order: 4), Event(event: "WORLD WAR I BEGINS IN EUROPE", order: 5), Event(event: "WORLD WAR I ENDS", order: 6), Event(event: "TR DIES – CARNEGIE DIES", order: 7), Event(event: "GERMAN MONEY HYPER INFLATES", order: 8), Event(event: "TREATY OF VERSAILLES, 19TH AMENDMENT", order: 9), Event(event: "HINDENBURG ELECTED PRESIDENT OF GERMANY", order: 10), Event(event: "STOCK MARKET CRASHES, DEPRESSION BEGINS", order: 11), Event(event: "HITLERS NAZI PARTY GAINS MAJORITY IN PARLIAMENT", order: 12), Event(event: "HITLER BEGINS TO TAKE POWER IN GERMANY", order: 13), Event(event: "FRANKLIN ROOSEVELT ELECTED PRESIDENT", order: 14), Event(event: "FDR INAUGURATED", order: 15), Event(event: "HINDENBURG DIES, HITLER APPOINTS HIMSELF PRESIDENT  -  FUEHRER", order: 16), Event(event: "FDR ELECTED AGAIN", order: 17), Event(event: "German airship HINDENBURG BURNS IN NEW JERSEY", order: 18), Event(event: "“MUNICH” – British P.M. Chamberlain agrees that Hitler can have Czechoslovakia.", order: 19), Event(event: "Germany invades Holland, Belgium and France – Churchill becomes P.M.", order: 20), Event(event: "Germany invades Russia", order: 21), Event(event: "JAPANESE ATTACK PEARL HARBOR – U.S. DECLARES WAR ON JAPAN", order: 22), Event(event: "HITLER DECLARES WAR ON U.S.", order: 23)]
    
    var allEvents2: [String] = ["SOUTHERN STATES PASS LAWS TO DISENFRANCISE BLACKS", "THEODORE ROOSEVELT ELECTED VICE PRESIDENT", "SAN FRANCISCO EARTHQUAKE", "FORD INTRODUCES MODEL T", "WORLD WAR I BEGINS IN EUROPE", "WORLD WAR I ENDS", "TR DIES – CARNEGIE DIES", "GERMAN MONEY HYPER INFLATES", "TREATY OF VERSAILLES, 19TH AMENDMENT", "HINDENBURG ELECTED PRESIDENT OF GERMANY", "STOCK MARKET CRASHES, DEPRESSION BEGINS", "HITLER’S NAZI PARTY GAINS MAJORITY IN PARLIAMENT", "HITLER BEGINS TO TAKE POWER IN GERMANY", "FRANKLIN ROOSEVELT ELECTED PRESIDENT", "FDR INAUGURATED “100 DAYS”", "HINDENBURG DIES, HITLER APPOINTS HIMSELF PRESIDENT  -  “ FUEHRER”", "FDR ELECTED AGAIN", "German airship HINDENBURG BURNS IN NEW JERSEY", "“MUNICH” – British P.M. Chamberlain agrees that Hitler can have Czechoslovakia.", "Germany invades Holland, Belgium and France – Churchill becomes P.M.", "Germany invades Russia", "JAPANESE ATTACK PEARL HARBOR – U.S. DECLARES WAR ON JAPAN", "HITLER DECLARES WAR ON U.S."]
    
// Pull event from the array, check in new array if event exsists, add event to array
    var events: [String] = [""]
    func getRandomEvent() -> String {
        let tempEvent = allEvents[GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)]
        return tempEvent.event
    }
    func isUniqueEvent(event: String, events: [String]) -> Bool {
        for someEvent in events {
            if (someEvent == event) {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
    func addRandomEvent() -> Void {
        while events.count <= 5 {
            let randomEvent = getRandomEvent()
                if isUniqueEvent(event: randomEvent, events: events) {
                    events.append(randomEvent)
                } else {
                    return
            }
            }
        }

    func setStarterLabels() -> Void {
        label1.text = events[1]
        label2.text = events[2]
        label3.text = events[3]
        label4.text = events[4]
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    func endRound() {
        timerLabel.isHidden = true
        let label1Index = allEvents2.index(of: label1.text!)
        let label2Index = allEvents2.index(of: label2.text!)
        let label3Index = allEvents2.index(of: label3.text!)
        let label4Index = allEvents2.index(of: label4.text!)
        if (label4Index! > label3Index!) && (label3Index! > label2Index!) && (label2Index! > label1Index!) {
            score = score + 1
            let successImage = UIImage(named: "next_round_success")! as UIImage
            nextRoundButtonOutlet.setImage(successImage, for: UIControlState.normal)
            nextRoundButtonOutlet.isHidden = false
            round = round + 1
            scoree.text = String(score)
        } else {
            let failImage  = UIImage(named: "next_round_fail")! as UIImage
            nextRoundButtonOutlet.setImage(failImage, for: UIControlState.normal)
            nextRoundButtonOutlet.isHidden = false
            round = round + 1
            scoree.text = String(score)
        }
        if (round == 6) {
            
        }
    }
    
    
    func counter() {
        seconds -= 1
        timerLabel.text = String(seconds)
        if (seconds == 0) {
            timer.invalidate()
            endRound()
        }
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            timer.invalidate()
            endRound()
        }
    }
    
// Set label to events

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomEvent()
        setStarterLabels()
        startTimer()
        nextRoundButtonOutlet.isHidden = true
    }

    
    
    
 
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

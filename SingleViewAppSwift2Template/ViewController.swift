//
//  ViewController.swift
//  SingleViewAppSwift2Template
//
//  Created by Treehouse on 9/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

//Implent shaker, implent starter view, implent ending view, repeats??
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
    
    
    var allEvents: [String] = ["SOUTHERN STATES PASS LAWS TO DISENFRANCISE BLACKS", "THEODORE ROOSEVELT ELECTED VICE PRESIDENT", "WRIGHT BROTHERS FIRST FLIGHT", "SAN FRANCISCO EARTHQUAKE", "FORD INTRODUCES MODEL T", "WORLD WAR I BEGINS IN EUROPE", "WORLD WAR I ENDS", "TR DIES – CARNEGIE DIES", "GERMAN MONEY HYPER INFLATES", "TREATY OF VERSAILLES, 19TH AMENDMENT", "HINDENBURG ELECTED PRESIDENT OF GERMANY", "STOCK MARKET CRASHES, DEPRESSION BEGINS", "HITLER’S NAZI PARTY GAINS MAJORITY IN PARLIAMENT", "HITLER BEGINS TO TAKE POWER IN GERMANY", "FRANKLIN ROOSEVELT ELECTED PRESIDENT", "FDR INAUGURATED “100 DAYS”", "HINDENBURG DIES, HITLER APPOINTS HIMSELF PRESIDENT  -  “ FUEHRER”", "FDR RE-ELECTED", "German airship HINDENBURG BURNS IN NEW JERSEY", "“MUNICH” – British P.M. Chamberlain agrees that Hitler can have Czechoslovakia.", "Germany invades Holland, Belgium and France – Churchill becomes P.M.", "Germany invades Russia", "JAPANESE ATTACK PEARL HARBOR – U.S. DECLARES WAR ON JAPAN", "HITLER DECLARES WAR ON U.S."]
    
// Pull event from the array, check in new array if event exsists, add event to array
    var events: [String] = [""]
    func getRandomEvent() -> String {
        return allEvents[GKRandomSource.sharedRandom().nextInt(upperBound: allEvents.count)]
    }
    func isUniqueEvent(event: String, events: [String]) -> Bool {
        for someEvent in events {
            if someEvent == event {
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
        let label1Index = allEvents.index(of: label1.text!)
        let label2Index = allEvents.index(of: label2.text!)
        let label3Index = allEvents.index(of: label3.text!)
        let label4Index = allEvents.index(of: label4.text!)
        if (label4Index! > label3Index!) && (label3Index! > label2Index!) && (label2Index! > label1Index!) {
            score = score + 1
            let successImage = UIImage(named: "next_round_success")! as UIImage
            nextRoundButtonOutlet.setImage(successImage, for: UIControlState.normal)
            nextRoundButtonOutlet.isHidden = false
            round = round + 1
        } else {
            let failImage  = UIImage(named: "next_round_fail")! as UIImage
            nextRoundButtonOutlet.setImage(failImage, for: UIControlState.normal)
            nextRoundButtonOutlet.isHidden = false
            round = round + 1
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

//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
       
        var totalTime = 0
        var timePassed = 0
        var timer = Timer()
        var player : AVAudioPlayer!
    
    
       
       @IBAction func buttonPressed(_ sender: UIButton) {
        progressBar.progress = 0.0
           timer.invalidate()
           let hardness = sender.currentTitle!
           totalTime =  eggTimes[hardness]!
        timePassed = 0
        textLabel.text = "You are now making \(hardness) eggs!"

             timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
           }


           @objc func updateCounter() {
               //example functionality
               if timePassed<totalTime {
                   timePassed += 1
                progressBar.progress = Float(timePassed)/Float(totalTime)
               } else if timePassed == totalTime {
                timer.invalidate()
                   textLabel.text = "Done"
                playSound(sound: "alarm_sound")
                
               }
           }
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    }


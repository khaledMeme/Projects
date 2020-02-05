//
//  ViewController.swift
//  Egg Timer
//
//  Created by Khaled Meme on 2/5/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggs : [String : Float] = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var secondsRemaining : Float = 0
    var totalSecond : Float = 0
    var timer = Timer()
    var hardness : String?
    var player : AVAudioPlayer!
    
    
    
    @IBAction func HardestButton(_ sender: UIButton) {
        
        timer.invalidate()
        secondsRemaining = 0
        hardness = sender.currentTitle
        doneLabel.text = hardness
        totalSecond = eggs[hardness!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if(secondsRemaining <= totalSecond) {
            progressBar.progress = Float(secondsRemaining / totalSecond)
            secondsRemaining += 1
        }else{
            timer.invalidate()
            self.doneLabel.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                self.doneLabel.text = "How do you like your eggs?"
            }
        }
    }
}


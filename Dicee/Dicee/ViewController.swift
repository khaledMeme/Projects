//
//  ViewController.swift
//  Dicee
//
//  Created by Khaled Meme on 1/28/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceeOne: UIImageView!
    @IBOutlet weak var diceeTwo: UIImageView!
    let diceeImages = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollDicee()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDicee()
        makeAnimation()
    }
    
    
    func rollDicee() {
        diceeOne.image = diceeImages.randomElement()
        diceeTwo.image = diceeImages.randomElement()
    }
    func makeAnimation() {
        diceeOne.transform = CGAffineTransform(translationX: -200, y: 0)
        diceeTwo.transform = CGAffineTransform(translationX: 200, y: 0)
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.diceeOne.transform = .identity
            self.diceeTwo.transform = .identity
        }, completion: nil)
    }
}


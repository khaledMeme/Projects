//
//  ViewController.swift
//  imageMask
//
//  Created by Khaled Meme on 1/14/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet weak var myimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //animatedView()
    }
    
    func animatedView() {
        UIView.animate(withDuration: 5, delay: 0, options: [.repeat,.autoreverse], animations: {
            self.myView.alpha = 0.3
        }, completion: nil)
    }

    @IBAction func popUpPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)

    }
}

extension ViewController: PopUpDelegate{
    func didAddEmail(with email: String) {
        print(email)
    }
    
    func didUpdatePassword(with password: String) {
        print(password)
    }
    
    
}

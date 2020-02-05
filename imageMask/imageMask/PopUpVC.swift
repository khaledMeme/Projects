//
//  PopUpVC.swift
//  imageMask
//
//  Created by Khaled Meme on 1/15/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
 
    @IBAction func BackwordButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUPButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

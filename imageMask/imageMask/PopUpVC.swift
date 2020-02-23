//
//  PopUpVC.swift
//  imageMask
//
//  Created by Khaled Meme on 1/15/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func didAddEmail(with email: String)
    func didUpdatePassword(with password: String)
}

class PopUpVC: UIViewController {
    var delegate: PopUpDelegate?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
 
    @IBAction func BackwordButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUPButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            delegate?.didAddEmail(with: email)
            delegate?.didUpdatePassword(with: password)
        }
        dismiss(animated: true, completion: nil)
    }
}

//
//  LoginVC.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/11/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import Firebase
class LoginVC: UIViewController {
    var firebaseConnection = FirebaseConnections()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseConnection.delegate = self
    }
    
    @IBAction func Login(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            firebaseConnection.LogIng(email, password)
        }
    }
    
}

//MARK:- FirebaseConnectionDelegate
extension LoginVC: FirebaseConnectionsDelegate{
    func didFailWithError(_ error: Error) {
        print(error)
    }
    func didLogedin() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: K.loginSegue, sender: self)
        }
    }
}

//
//  RegisterVC.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/11/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import Firebase
class RegisterVC: UIViewController {
    var firebaseConnection = FirebaseConnections()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseConnection.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailTextField.text , let password = passwordTextField.text{
            firebaseConnection.Register(email, password)
        }
    }
}

//MARK:- FirebaseConnectionDelegate
extension RegisterVC: FirebaseConnectionsDelegate{
    func didFailWithError(_ error: Error) {
        print(error)
    }
    func didAsignNewUser() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: K.registerSegue, sender: self)
        }
    }
}

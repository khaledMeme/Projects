//
//  ChatVC.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/11/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
    var messages : [Message] = []
    var firebaseConnection = FirebaseConnections()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        messageTextField.delegate = self
        firebaseConnection.delegate = self
        firebaseConnection.loadMessages()
    }
    func sendMessage(){
        if !messageTextField.text!.isEmpty{
            if let messageBody = messageTextField.text{
                firebaseConnection.sendMessage(with: messageBody)
                messageTextField.text = ""
            }
        }
        else{
            messageTextField.placeholder = "Type somthing"
        }
    }
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        firebaseConnection.logOut()
    }
}


//MARK:- UITableViewDataSource

extension ChatVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        if message.sender == Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBody.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.messageBody.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
    
    
}


//MARK:- TextFieldDelegate
extension ChatVC: UITextFieldDelegate{
    @IBAction func sendMessageButton(_ sender: UIButton) {
        sendMessage()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }
}

//MARK:- FirebaseConnectionDelegate
extension ChatVC: FirebaseConnectionsDelegate{
    func didFailWithError(_ error: Error) {
        print(error)
    }
    func didLogout() {
        navigationController?.popToRootViewController(animated: true)
    }
    func didUpdateMessages(_ messages: [Message]) {
        self.messages = messages
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
}

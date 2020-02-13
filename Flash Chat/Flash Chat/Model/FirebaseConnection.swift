//
//  FirebaseConnection.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/12/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import Foundation
import Firebase
protocol FirebaseConnectionsDelegate {
    func didUpdateMessages(_ messages:[Message])
    func didAsignNewUser()
    func didLogedin()
    func didLogout()
    func didFailWithError(_ error: Error)
}
extension FirebaseConnectionsDelegate{
    func didUpdateMessages(_ messages:[Message]){}
    func didAsignNewUser(){}
    func didLogedin(){}
    func didLogout(){}
}
struct FirebaseConnections{
    var delegate : FirebaseConnectionsDelegate?
    let db = Firestore.firestore()
    
    func sendMessage(with messageBody: String){
        if let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName)
                .addDocument(data: [
                    K.FStore.bodyField : messageBody,
                    K.FStore.senderField : messageSender,
                    K.FStore.dateField : Date().timeIntervalSince1970
                ]) { (error) in
                    if let e = error {
                        self.delegate?.didFailWithError(e)
                    }
            }
        }
    }
    
    func loadMessages() {
        var messages: [Message] = []
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapShot, error) in
                if let e = error {
                    print("There was an issue in retrieving data from FireStore \(e)")
                }else{
                    messages = []
                    if let snapshotDocument = querySnapShot?.documents{
                        for doc in snapshotDocument {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String{
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                messages.append(newMessage)
                                self.delegate?.didUpdateMessages(messages)
                            }
                        }
                    }
                }
        }
    }
    
    func logOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            delegate?.didLogout()
        } catch let signOutError as NSError {
            delegate?.didFailWithError(signOutError)
        }
    }
    
    func Register(_ email: String, _ password: String) {
        Auth.auth()
            .createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    self.delegate?.didFailWithError(e)
                } else{
                    self.delegate?.didAsignNewUser()
                }
        }
    }
    
    func LogIng(_ email: String, _ password: String) {
        Auth.auth()
            .signIn(withEmail: email, password: password) {  authResult, error in
            if let e = error {
                self.delegate?.didFailWithError(e)
            } else{
                self.delegate?.didLogedin()
            }
        }

    }
}

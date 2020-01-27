//
//  ViewController.swift
//  Secret Project
//
//  Created by Khaled Meme on 1/26/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    @IBOutlet weak var button: UIButtonX!
    @IBOutlet weak var pencil: UIButton!
    @IBOutlet weak var chat: UIButton!
    @IBOutlet weak var alarm: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print(menuView.transform)
        print(button.transform)
        closeMenu()
    }
    
    @IBAction func floatingActionButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            if self.menuView.transform == .identity{
                self.closeMenu()
            }
            else{
                self.menuView.transform = .identity
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity {
                self.pencil.transform = .identity
                self.chat.transform = .identity
                self.alarm.transform = .identity
            }
        }, completion: nil)
    }
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        pencil.transform = CGAffineTransform(translationX: 0, y: 15)
        chat.transform = CGAffineTransform(translationX: 11, y: 11)
        alarm.transform = CGAffineTransform(translationX: 15, y: 0)
    }
}

//MARK:- TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        return cell
    }
    
    
}

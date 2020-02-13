//
//  WelcomeVC.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/11/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
import CLTypingLabel
class WelcomeVC: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
    }

}

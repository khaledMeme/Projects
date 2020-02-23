//
//  AlertPopUpVC.swift
//  Todoey
//
//  Created by Khaled Meme on 2/22/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
protocol PopUpDelegate {
    func didAddItem(with item: Item)
}
class AlertPopUpVC: UIViewController {
    var delegate: PopUpDelegate?
    let myItem = Item()
    @IBOutlet weak var addTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField.delegate = self
    }
    func dismissVC() {
        if let title = addTextField.text {
            myItem.title = title
            delegate?.didAddItem(with: myItem)
        }
        dismiss(animated: true, completion: nil)
    }
}

//MARK:- TextFieldDelegate
extension AlertPopUpVC: UITextFieldDelegate{
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addItemPressed(_ sender: UIButton) {
        dismissVC()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        dismissVC()
        return true
    }
}


//
//  ToDoListVC.swift
//  Todoey
//
//  Created by Khaled Meme on 2/22/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit


class ToDoListVC: UITableViewController {
    var ItemArray = [Item]()
    var userdata = UserDataManager()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        userdata.delegate = self
        userdata.getItems()
    }
    
    @IBAction func AddItemPressed(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlertPopUpVC") as! AlertPopUpVC
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = ItemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.selected ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ItemArray[indexPath.row].selected = !ItemArray[indexPath.row].selected
        userdata.saveItems(ItemArray)
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.tableView.reloadData()
        }
        
        
    }
}

//MARK:- PopUp Delegate

extension ToDoListVC: PopUpDelegate{
    func didAddItem(with item: Item) {
        ItemArray.append(item)
        userdata.saveItems(ItemArray)
        tableView.reloadData()
    }
}

//MARK:- UserDataDelegate

extension ToDoListVC: UserDataDelegate{
    func didUpdateData(with items: [Item]) {
        DispatchQueue.main.async {
            self.ItemArray = items
            self.tableView.reloadData()
        }
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

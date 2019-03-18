//
//  ViewController.swift
//  toDoList
//
//  Created by reza abdolmaleki on 3/17/19.
//  Copyright © 2019 reza abdolmaleki. All rights reserved.
//

import UIKit

class toDoListViewController: UITableViewController {
    
    var toDoArrayClass = [toDo]()
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(filePath!)
        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArrayClass.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = toDoArrayClass[indexPath.row]
        item.isCheked = !item.isCheked
        
        saveData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        let item = toDoArrayClass[indexPath.row]
        cell.textLabel?.text = item.toDoName
        
        cell.accessoryType = item.isCheked ? .checkmark : .none
        
        return cell
    }
    
    //Mark - alert for add to DoList
    @IBAction func addToDoList(_ sender: UIBarButtonItem) {
        
        var newTxtField = UITextField()
        let alert = UIAlertController(title: "toDo Name", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newItem = toDo()
            newItem.toDoName = newTxtField.text!
            self.toDoArrayClass.append(newItem)
            
            self.saveData()
        }
        
        alert.addTextField { (txtField) in
            txtField.placeholder = "Here input your text"
            newTxtField = txtField
        }
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }
    
    func saveData() {
        let myEncoder = PropertyListEncoder()
        do {
            let myData = try myEncoder.encode(toDoArrayClass)
            try myData.write(to: filePath!)
        }catch {
            print("Cannt Save Data beause \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        if let myData = try? Data(contentsOf: filePath!) {
            let myDecoder = PropertyListDecoder()
            do {
                toDoArrayClass = try myDecoder.decode([toDo].self, from: myData)
            }catch {
                print(error)
            }
        }
    }
}

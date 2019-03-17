//
//  ViewController.swift
//  toDoList
//
//  Created by reza abdolmaleki on 3/17/19.
//  Copyright © 2019 reza abdolmaleki. All rights reserved.
//

import UIKit

class toDoListViewController: UITableViewController {
    
    let userData = UserDefaults.standard
    var toDoArrayClass = [toDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //toDoArrayClass = userData.array(forKey: "myListAsArray") as! [toDo]
        
        let item1 = toDo()
        item1.toDoName = "item1"
        toDoArrayClass.append(item1)
        
        let item2 = toDo()
        item2.toDoName = "item2"
        toDoArrayClass.append(item2)
        
        let item3 = toDo()
        item3.toDoName = "item3"
        toDoArrayClass.append(item3)
        
        let item4 = toDo()
        item4.toDoName = "item4"
        toDoArrayClass.append(item4)
        
        let item5 = toDo()
        item5.toDoName = "item5"
        toDoArrayClass.append(item5)
        
        let item6 = toDo()
        item6.toDoName = "item6"
        toDoArrayClass.append(item6)
        
        let item7 = toDo()
        item7.toDoName = "item7"
        toDoArrayClass.append(item7)
        
        let item8 = toDo()
        item8.toDoName = "item8"
        toDoArrayClass.append(item8)
        
        let item9 = toDo()
        item9.toDoName = "item9"
        toDoArrayClass.append(item9)
        
        let item10 = toDo()
        item10.toDoName = "item10"
        toDoArrayClass.append(item10)
        
        let item11 = toDo()
        item11.toDoName = "item11"
        toDoArrayClass.append(item11)
        
        let item12 = toDo()
        item12.toDoName = "item12"
        toDoArrayClass.append(item12)
        
        let item13 = toDo()
        item13.toDoName = "item13"
        toDoArrayClass.append(item13)
        
        let item14 = toDo()
        item14.toDoName = "item14"
        toDoArrayClass.append(item14)
        
        let item15 = toDo()
        item15.toDoName = "item15"
        toDoArrayClass.append(item15)
        
        let item16 = toDo()
        item16.toDoName = "item16"
        toDoArrayClass.append(item16)
        
        let item17 = toDo()
        item17.toDoName = "item17"
        toDoArrayClass.append(item17)
        
        let item18 = toDo()
        item18.toDoName = "item18"
        toDoArrayClass.append(item18)
        
        let item19 = toDo()
        item19.toDoName = "item19"
        toDoArrayClass.append(item19)
        
//        if let items = userData.array(forKey: "myListAsArray") as? [toDo] {
//            toDoArrayClass = items
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArrayClass.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = toDoArrayClass[indexPath.row]
        item.isCheked = !item.isCheked
        
        tableView.reloadData()
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
        let alert = UIAlertController(title: "نام کار جدید", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "افزودن", style: .default) { (action) in
            
        }
        
        alert.addTextField { (txtField) in
            txtField.placeholder = "اینجا وارد کنید"
            newTxtField = txtField
        }
        
        let newItem = toDo()
        newItem.toDoName = newTxtField.text!
        self.toDoArrayClass.append(newItem)
        
        self.userData.set(self.toDoArrayClass, forKey: "myListAsArray")
        
        self.tableView.reloadData()
        
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }
}

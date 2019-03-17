//
//  ViewController.swift
//  toDoList
//
//  Created by reza abdolmaleki on 3/17/19.
//  Copyright © 2019 reza abdolmaleki. All rights reserved.
//

import UIKit

class toDoListViewController: UITableViewController {
    
    let toDoArray = ["خرید صبحانه", "خشک شویی", "محل کار", "نهار", "استراحت عصر", "خرید خونه", "کفاشی", "فیلم"]
    
//    let toDoArray = ["one", "tow", "three", "for", "five", "six", "seven", "eight"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(toDoArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark 
        }
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
}


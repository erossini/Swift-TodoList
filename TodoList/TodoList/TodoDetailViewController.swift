//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by Enrico Rossini on 15/08/2021.
//

import UIKit

class TodoDetailViewController: UIViewController {

    var toDo = ToDo()
    
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo.priority == 1 {
            todoLabel.text = "❗️" + toDo.name
        }
        else if toDo.priority == 2 {
            todoLabel.text = "‼️" + toDo.name
        }
        else {
            todoLabel.text = toDo.name
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
}
